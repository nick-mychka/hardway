class MarathonsController < ApplicationController
  def index
    marathons = Marathon.all
    render json: MarathonBlueprint.render(marathons)
  end

  def create
    marathon = Marathon.new(marathon_params)
    marathon.save!
    render json: MarathonBlueprint.render(marathon), status: :created
  rescue
    render json: marathon, status: :unprocessable_entity
  end

  def show
    render json: MarathonBlueprint.render(current_marathon), status: :ok
  rescue
    render json: "Not Found", status: :not_found
  end

  def destroy
    current_marathon.destroy
    head :no_content
  end

  def boards
    render json: BoardBlueprint.render(current_marathon.boards), status: :ok
  rescue
    render json: "Not Found", status: :not_found
  end

  private

  def marathon_params
    params.require(:marathon).permit(:title, :cover_url, :date_from, :date_to)
  end

  def current_marathon
    @_current_marathon ||= Marathon.find(params[:id])
  end
end
