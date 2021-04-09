class <%= class_name %> < ActiveRecord::Base
  has_visibility
  acts_as_list
  default_scope :order => :position
end
