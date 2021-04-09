class HighlightSweeper < CacheSweeper
  observe Highlight, HighlightImage

  def self.expire
    expire_page("/index.html")
    expire_pages("/highlights/*.html")
  end

  def after_save(highlight)
    self.class::expire
  end

  def after_destroy(highlight)
    self.class::expire
  end
end