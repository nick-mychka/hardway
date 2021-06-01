class ListsController < ApplicationController
  def show
    lists = List.all
    render json: lists
  end
end
