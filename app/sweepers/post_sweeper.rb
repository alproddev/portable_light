class PostSweeper < CacheSweeper
  observe Post

  def self.expire
    expire_page("/index.html")
    expire_page("/about.html")
    expire_page("/news.html")
    expire_pages("/news/page/*.html")
  end

  def after_save(post)
    self.class::expire
  end

  def after_destroy(post)
    self.class::expire
  end
end