class Admin::HomesController < ApplicationController

  def top
    @introductions = Introduction.all
  end
end
