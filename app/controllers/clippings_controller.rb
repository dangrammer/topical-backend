class ClippingsController < ApplicationController

  def index
    clippings = Clipping.all
    render json: clippings
  end

end
