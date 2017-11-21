class HomepagelookbookController < ApplicationController

    def show
      @collections = Collection.where("lookbook is not null")
                                .where(brand_id: params[:id])
    end
end
