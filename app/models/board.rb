class Board < ApplicationRecord
  validates :title, :date, presence: true

  has_many :items, dependent: :destroy
  belongs_to :marathon, optional: true

  scope :todays_boards, -> { where(date: Time.current.beginning_of_day..Time.current.end_of_day) }
  scope :standalone_boards, -> { where(marathon_id: nil).order(date: :desc) }
end
