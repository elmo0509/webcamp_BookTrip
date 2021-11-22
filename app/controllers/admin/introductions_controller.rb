class Admin::IntroductionsController < ApplicationController

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
      redirect_to admin_introduction_path(@introduction.id)
    else
      render :edit
    end
  end

  private
  def introduction_params
    params.require(:introduction).permit(:place, :author, :title, :address_prefecture, :address_after_prefecture, :address_building_name, :introduction)
  end

end
