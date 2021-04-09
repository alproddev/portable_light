class HighlightImage < ActiveRecord::Base
  belongs_to :highlight
  RequiredDimensions = [975,414]
  has_attached_file :file,
                    :styles => { :normal => ["#{RequiredDimensions.join('x')}#"], :thumb => "50x50#" },
                    :default_style => :normal, 
                    :url => Settings[:paperclip][:url_pattern],
                    :path => Settings[:paperclip][:path_pattern],
                    :default_url => Settings[:paperclip][:default_url]
end
