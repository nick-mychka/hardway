class BoardsController < ApplicationController
  def index
    boards = Board.all
    render json: boards
  end

  def create
    board = Board.new(board_params)
    board.save!
    render json: board, status: :created
  rescue
    render json: board, adapter: :json_api,
    serializer: ErrorSerializer,
    status: :unprocessable_entity
  end

  private

  def board_params
    params.require(:data).require(:attributes).permit(:title, :date)
  end
end
