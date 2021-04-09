class Admin::PostsController < AdminController
  cache_sweeper :post_sweeper
end
