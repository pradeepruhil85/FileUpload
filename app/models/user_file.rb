class UserFile < ApplicationRecord
  has_many_attached :files
  belongs_to :user
end
