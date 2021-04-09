class PostsController < ApplicationController

  def index
    @posts = Post.visible.all.paginate :per_page => 10, :page => params[:page]
  end
end
