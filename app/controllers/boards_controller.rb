class BoardsController < ApplicationController
  def index
    boards = Board.all
    render json: BoardBlueprint.render(boards)
  end

  def create
    board = Board.new(board_params)
    board.save!
    render json: BoardBlueprint.render(board), status: :created
  rescue
    render json: board, status: :unprocessable_entity
  end

  def show
    render json: BoardBlueprint.render(current_board), status: :ok
  rescue
    render json: "Not Found", status: :not_found
  end

  def destroy
    current_board.destroy
    head :no_content
  end

  def todays_boards
    boards = Board.todays_boards
    render json: BoardBlueprint.render(boards), status: :ok
  rescue
    render json: "Not Found", status: :not_found
  end

  def standalone_boards
    boards = Board.standalone_boards
    render json: BoardBlueprint.render(boards)
  end

  private

  def board_params
    params.require(:board).permit(:title, :date, :marathon_id)
  end

  def current_board
    @_current_board ||= Board.find(params[:id])
  end
end
