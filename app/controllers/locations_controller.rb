class LocationsController < ApplicationController

  def show
    @posts = Post.where(location_id: params[:id])
  end

end