class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]

    if @range == "Spot"
      @spots = Spot.looks(params[:search], params[:word])
    end
  end
end
