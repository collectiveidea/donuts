class Claim < ActiveRecord::Base
  belongs_to :user, inverse_of: :claims

  validates :user, :date, presence: true, strict: true
end
