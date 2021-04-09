class Post < ActiveRecord::Base
  has_visibility
  acts_as_list
  acts_as_markdown :intro, :body
  RequiredDimensions = [700,150]
  has_attached_file :image,
                    :styles => { :normal => ["#{RequiredDimensions.join('x')}#"] },
                    :default_style => :normal, 
                    :url => Settings[:paperclip][:url_pattern],
                    :path => Settings[:paperclip][:path_pattern],
                    :default_url => Settings[:paperclip][:default_url]
  default_scope :order => :position

  validates_presence_of :title, :intro
end
