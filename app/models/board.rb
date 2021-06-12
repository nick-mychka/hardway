class Board < ApplicationRecord
  validates :title, :date, presence: true
  has_many :items, dependent: :destroy
end
