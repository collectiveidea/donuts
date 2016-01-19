class User < ActiveRecord::Base
  has_many :claims, inverse_of: :user, dependent: :destroy

  validates :github_login, presence: true, uniqueness: true, strict: true

  def self.from_auth(auth)
    User.find_or_initialize_by(github_login: auth.info.nickname).tap do |user|
      user.name = auth.info.name.presence
      user.save!
    end
  end

  def claimed_today?
    claims.where(date: Date.current).exists?
  end
end
