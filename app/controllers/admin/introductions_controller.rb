class Admin::IntroductionsController < ApplicationController
  before_action :authenticate_admin!

  def show
    @introduction = Introduction.find(params[:id])
    @introduction_comment = IntroductionComment.new
    @user = @introduction.user
  end

  def edit
    @introduction = Introduction.find(params[:id])
  end

  def update
    @introduction = Introduction.find(params[:id])
    if @introduction.update(introduction_params)
      flash[:notice] = "Admin: Spot was successfully updated."
      redirect_to admin_introduction_path(@introduction.id)
    else
      render :edit
    end
  end

  def destroy
    @introduction = Introduction.find(params[:id])
    @introduction.destroy
    flash[:notice] = "Admin: Spot was successfully deleted."
    redirect_to admin_root_path
  end

  private
  def introduction_params
    params.require(:introduction).permit(:image, :place, :author, :title, :address_prefecture, :address_after_prefecture, :address_building_name, :introduction)
  end

end
