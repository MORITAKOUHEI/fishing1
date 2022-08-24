class SpotsController < ApplicationController
  def new
    @spot = Spot.new
  end

  def index
    @spots = Spot.all
  end

  def show
    @spot = Spot.find(params[:id])
    @user = @spot.user
  end

  def edit
    @spot = Spot.find(params[:id])
    if @spot.user == current_user
      render :edit
    else
      redirect_to spots_path
    end
  end

  def create
    @spot = Spot.new(spot_params)
    @spot.user_id = current_user.id
    @spot.save
    redirect_to spots_path
  end

  def update
    @spot = Spot.find(params[:id])
    if @spot.update(spot_params)
      flash[:notice] = "You have updated spot successfully."
      redirect_to spot_path(@spot.id)
    else
      render :edit
    end
  end

  def destroy
    @spot = Spot.find(params[:id])
    @spot.destroy
    redirect_to spots_path
  end


  private

  def spot_params
    params.require(:spot).permit(:spot_name, :caught_fish, :image, :prefecture_name)
  end
end
