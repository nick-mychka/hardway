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

  def show
    board = Board.find(params[:id])
    render json: board, status: :ok
  rescue
    render json: "Not Found", status: :not_found
  end

  def destroy
    board = Board.find(params[:id])
    board.destroy
    head :no_content
  end

  private

  def board_params
    params.require(:data).require(:attributes).permit(:title, :date)
  end
end
