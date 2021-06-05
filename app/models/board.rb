class Board < ApplicationRecord
  validates :title, :date, presence: true
end
