class Claim < ActiveRecord::Base
  belongs_to :user, inverse_of: :claims

  validates :user, :date, presence: true, strict: true

  scope :today, -> { where(date: Date.current).order(created_at: :asc) }
end
