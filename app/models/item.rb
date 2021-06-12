class Item < ApplicationRecord
  validates :title, presence: true
  belongs_to :board
end
