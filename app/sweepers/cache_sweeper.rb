class CacheSweeper < ActionController::Caching::Sweeper

  def self.expire_all
    expire_pages("/*")
  end

  protected

  def self.expire_page(page)
    page_cache_directory = ActionController::Base.page_cache_directory
    unless page_cache_directory == Rails.root + "/public"
      FileUtils.rm(File.join(page_cache_directory, page)) rescue Errno::ENOENT
    end
  end

  def self.expire_pages(pages)
    page_cache_directory = ActionController::Base.page_cache_directory
    unless page_cache_directory == Rails.root + "/public"
      FileUtils.rm_r(Dir.glob(page_cache_directory + pages)) rescue Errno::ENOENT
    end
  end
end