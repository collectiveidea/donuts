class User < ActiveRecord::Base
  has_many :claims, inverse_of: :user, dependent: :destroy

  validates :github_login, presence: true, uniqueness: true, strict: true
end
