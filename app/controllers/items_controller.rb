class ItemsController < ApplicationController
  def index
    render json: ItemBlueprint.render(current_board.items), status: :ok
  rescue
    render json: "Not Found", status: :not_found
  end

  def create
    item = current_board.items.new(item_params)
    item.save!
    render json: ItemBlueprint.render(item), status: :created
  rescue
    render json: item, status: :unprocessable_entity
  end

  def destroy
    current_item.destroy
    head :no_content
  end

  def update
    current_item.update!(update_item_params)
    render json: ItemBlueprint.render(current_item), status: :ok
  rescue
    render json: current_item, status: :unprocessable_entity
  end

  private

  def item_params
    params.require(:item).permit(:title, :done, :board_id)
  end

  def update_item_params
    params.require(:item).permit(:done)
  end

  def current_board
    @_current_board ||= Board.find(params[:board_id])
  end

  def current_item
    @_current_item ||= current_board.items.find(params[:id])
  end
end
