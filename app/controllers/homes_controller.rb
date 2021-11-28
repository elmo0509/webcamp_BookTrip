class HomesController < ApplicationController

  def top
    @all_ranks = Introduction.find(Favorite.group(:introduction_id).order('count(introduction_id) desc').limit(5).pluck(:introduction_id))
    @month_ranks = Introduction.find(Favorite.group(:introduction_id).where(created_at: Time.current.all_month).order('count(introduction_id) desc').limit(5).pluck(:introduction_id))
  end

  def about
  end

end
