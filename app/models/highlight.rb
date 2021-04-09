class Highlight < ActiveRecord::Base
  has_many :images, :class_name => "HighlightImage"

  has_visibility
  acts_as_list
  acts_as_markdown :body, :related_links
  has_attached_file :download,
                    :url => Settings[:paperclip][:url_pattern],
                    :path => Settings[:paperclip][:path_pattern]

  default_scope :order => :position
  accepts_nested_attributes_for :images, :allow_destroy => true

  validates_presence_of :title, :body
end
