class ItemsController < ApplicationController
  def index
    items = Item.all
    render json: items
  end

  def create
    item = Item.new(item_params)
    item.save!
    render json: item, status: :created
  rescue
    render json: item, adapter: :json_api,
    serializer: ErrorSerializer,
    status: :unprocessable_entity
  end

  private

  def item_params
    params.require(:data).require(:attributes).permit(:title, :done, :board_id)
  end
end
