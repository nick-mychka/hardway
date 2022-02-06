class MarathonsController < ApplicationController
  def index
    marathons = Marathon.all
    render json: marathons
  end

  def create
    marathon = Marathon.new(marathon_params)
    marathon.save!
    render json: marathon, status: :created
  rescue
    render json: marathon, adapter: :json_api,
    serializer: ErrorSerializer,
    status: :unprocessable_entity
  end

  def show
    marathon = Marathon.find(params[:id])
    render json: marathon, status: :ok
  rescue
    render json: "Not Found", status: :not_found
  end

  def destroy
    marathon = Marathon.find(params[:id])
    marathon.destroy
    head :no_content
  end

  def boards
    marathon = Marathon.find(params[:id])
    render json: marathon.boards, status: :ok
  rescue
    render json: "Not Found", status: :not_found
  end

  private

  def marathon_params
    params.require(:data).require(:attributes).permit(:title, :cover_url, :date_from, :date_to)
  end
end
