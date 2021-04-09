require "#{File.dirname(__FILE__)}/../../vendor/plugins/moonshine/lib/moonshine.rb"
class ApplicationManifest < Moonshine::Manifest::Rails
  configure(:passenger => { :page_cache_directory => '/cache' })

  recipe :default_stack
  recipe :imagemagick
end