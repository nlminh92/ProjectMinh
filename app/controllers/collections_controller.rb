class CollectionsController < ApplicationController
  before_action :user_signin
  before_action :user_actived
  # skip_before_action :verify_authenticity_token
  skip_before_filter :verify_authenticity_token

  def index
    @collections = Collection.all
  end

  def show
    @collection = Collection.find_by id: params[:id]
  end
  
  def new
    @product = Product.all
  end

  def create
    @colection = Collection.new
    @colection.name_collections = params[:title]
    @colection.image = params[:picture]
    @colection.description = params[:description]
    @colection.date_availability = params[:available]


    @colection.save
    redirect_to @colection
  end
end
