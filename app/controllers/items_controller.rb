class ItemsController < ApplicationController
  def index
    items = Item.all
    render json: ItemBlueprint.render(items)
  end

  def create
    item = Item.new(item_params)
    item.save!
    render json: ItemBlueprint.render(item), status: :created
  rescue
    render json: ItemBlueprint.render(item), status: :unprocessable_entity
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    head :no_content
  end

  def update
    item = Item.find(params[:id])
    item.update!(update_item_params)
    render json: ItemBlueprint.render(item), status: :ok
  rescue
    render json: ItemBlueprint.render(item), status: :unprocessable_entity
  end

  private

  def item_params
    params.require(:data).require(:attributes).permit(:title, :done, :board_id)
  end

  def update_item_params
    params.require(:data).require(:attributes).permit(:done)
  end
end
