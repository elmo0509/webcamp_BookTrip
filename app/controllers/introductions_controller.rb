class IntroductionsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def new
    @introduction = Introduction.new
  end

  def create
    @introduction = Introduction.new(introduction_params)
    @introduction.user_id = current_user.id
    if @introduction.save
      redirect_to introductions_path
    else
      render :edit
    end
  end

  def show
    @introduction = Introduction.find(params[:id])
    @introduction_comment = IntroductionComment.new
    @user = @introduction.user
  end

  def index
    @introductions = Introduction.all.order(created_at: :desc)
  end

  def edit
    @introduction = Introduction.find(params[:id])
  end

  def update
    @introduction = Introduction.find(params[:id])
    if @introduction.update(introduction_params)
      redirect_to introduction_path(@introduction.id)
    else
      render :edit
    end
  end

  def destroy
    @introduction = Introduction.find(params[:id])
    @introduction.destroy
    redirect_to introductions_path
  end

  private
  def introduction_params
    params.require(:introduction).permit(:image, :place, :author, :title, :address_prefecture, :address_after_prefecture, :address_building_name, :introduction)
  end

end
