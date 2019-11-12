class CollectionsController < ApplicationController

  def index
    collections = Collection.all
    render json: collections
  end

  def create
    collection = Collection.create(collection_params)
    render json: collection
  end

  private

  def collection_params
    params.require(:collection).permit(:name, :user_id)
  end
  
end
