class SpotsController < ApplicationController
  def new
    @spot = Spot.new
  end

  def index
    @spots = Spot.page(params[:page])
  end

  def show
    @spot = Spot.find(params[:id])
    @user = @spot.user
    @spot_comment = SpotComment.new
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
    if @spot.save
    redirect_to spots_path
    else
      render :new
    end
  end

  def update
    @spot = Spot.find(params[:id])
    if @spot.update(spot_params)
      flash[:notice] = "編集されました"
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
