class HomeController < ApplicationController
  def index
    @posts = Post.visible.all(:limit => 4)
    @highlights = Highlight.visible.all(:limit => 5)
  end
end
