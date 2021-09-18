class Tag < ApplicationRecord
  belongs_to :taggable, polymorphic: true
  attr_accessor :name
end
