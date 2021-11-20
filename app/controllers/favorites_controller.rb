class FavoritesController < ApplicationController

  def create
    @introduction = Introduction.find(params[:introduction_id])
    favorite = current_user.favorites.new(introduction_id: @introduction.id)
    favorite.save
  end

  def destroy
    @introduction = Introduction.find(params[:introduction_id])
    favorite = current_user.favorites.find_by(introduction_id: @introduction.id)
    favorite.destroy
  end

end
