class AboutController < ApplicationController

  def index
    @posts = Post.visible.all(:limit => 4)
  end

end
