class HighlightsController < ApplicationController

  def index
    redirect_to home_url
  end

  def show
    @highlight = Highlight.visible.find(params[:id])
    @images = @highlight.images.reject { |image| !image.file? }
  rescue
    redirect_to highlights_url
  end

end
