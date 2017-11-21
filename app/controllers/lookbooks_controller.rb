class LookbooksController < ApplicationController

  def index
    @collections = Collection.where("lookbook is not null")
  end
end
