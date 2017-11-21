class CollectionsController < ApplicationController
  before_action :user_signin
  before_action :user_actived
  # skip_before_action :verify_authenticity_token
  skip_before_filter :verify_authenticity_token

  def index
    if current_user.type_user == 0
      @collections = Collection.where("brand_id=?", current_user.brand.id).order('created_at DESC')
    elsif current_user.type_user == 1
      @collections = Collection.where("retailler_id=?", current_user.brand.id).order('created_at DESC')
    end
  end

  def show
    @collection = Collection.find_by id: params[:id]
    if params[:file] == "1"
      send_file Rails.root.join('public', "lookbooks", @collection.lookbook),
        :type =>"application/pdf",:x_sendfile => true
    else
      @product = Product.where(collection_id: params[:id])
    end
  end

  def edit
    @collection = Collection.find_by id: params[:id]
    @product = Product.where(collection_id: params[:id])
    @id = @product.pluck(:id)
    if @id.length != 0
      @product_2 = Product.where("collection_id is null and id NOT IN (?)", @id)
    else
      @product_2 = Product.where("collection_id is null")
    end
  end

  def update
    @product = Product.where(collection_id: params[:id])
    @product.each do |i|
      i.update_attributes(collection_id: nil)
    end
    @collection = Collection.find_by id: params[:id]
    if params[:picture].present?
      @collection.update_attributes(name_collections: params[:title],
        image: params[:picture],
        status: params[:optradio],
        description: params[:description],
        date_availability: params[:available])
    else
      @collection.update_attributes(name_collections: params[:title],
        status: params[:optradio],
        description: params[:description],
        date_availability: params[:available])
    end
    if params[:lookbook].present?
      pdf_file_name_output = 5.times.collect{[*'1'..'9'].sample}.join + Time.now.to_i.to_s + ".pdf"
      upload_lookbook = params[:lookbook]
      File.open(Rails.root.join('public', 'lookbooks',
        pdf_file_name_output), 'wb') do |file|
        file.write(upload_lookbook.read)
      end 
      tmp = pdf_file_name_output
      @collection.update_attributes(lookbook: tmp.to_s)
    end
    @products = params[:products]
    if @products.present?
      @products.each do |i|
        product = Product.find_by(id: i)
        product.update_attributes(collection_id: params[:id])
      end
    end
    redirect_to collection_path(params[:id])
  end

  def new
    if current_user.type_user == 0
      @product = Product.where("brand_id=? and active=true and collection_id is null", current_user.brand.id)
    elsif current_user.type_user == 1
      @product = Product.where("retailler_id=? and active=true and collection_id is null", current_user.retailler.id)
    end
  end

  def create
    @colection = Collection.new
    @colection.name_collections = params[:title]
    if params[:picture].present?
      @colection.image = params[:picture]
    end
    @colection.status = params[:optradio]
    @colection.description = params[:description]
    @colection.date_availability = params[:available]
    if params[:lookbook].present?
      pdf_file_name_output = 5.times.collect{[*'1'..'9'].sample}.join + Time.now.to_i.to_s + ".pdf"
      upload_lookbook = params[:lookbook]
      File.open(Rails.root.join('public', 'lookbooks',
        pdf_file_name_output), 'wb') do |file|
        file.write(upload_lookbook.read)
      end
      @colection.lookbook = pdf_file_name_output
    end
    @products = params[:products]
    if current_user.type_user == 0
      @colection.brand_id = current_user.brand.id
    elsif current_user.type_user == 1
      @colection.retailler_id = current_user.retailler.id
    end

    @colection.save
    if @products.present?
      @products.each do |i|
        product = Product.find_by(id: i)
        product.update_attributes(collection_id: @colection.id)
      end
    end
    redirect_to @colection
  end

  def destroy
    @collection = Collection.find_by id: params[:id]
    @product_id = @collection.products.pluck(:id)
    @cards = Card.where("brand_id = ?", current_user.brand.id)
    @check = true
    @cards.each do |card|
      card.orders.each do |order|
        @product_id.each do |id|
          if id == order.product_id
            @check = false
            break
          end
        end
      end
    end
    if @check
      @collection.destroy
      flash[:success] = "Delete collection success"
    else
      flash[:danger] = "Delete fail, collection is not disponible, contacter admin"
    end
    redirect_to collections_url
  end
end
