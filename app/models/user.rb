class User < ActiveRecord::Base
  has_many :claims, inverse_of: :user, dependent: :destroy

  validates :github_login, presence: true, uniqueness: true, strict: true

  def self.from_auth(auth)
    User.find_or_initialize_by(github_login: auth.info.nickname).tap do |user|
      user.name = auth.info.name.presence.try(:squish)
      user.save!
    end
  end

  def self.claiming_today
    Claim.today.includes(:user).map(&:user).uniq
  end

  def claimed_today?
    claims.where(date: Date.current).exists?
  end

  def display_name
    match = name.to_s.match(/\A(?<first_name>[^ ]+) [^ ]+\z/)
    match && match[:first_name] || name || "@#{github_login}"
  end

  def github_url
    "https://github.com/#{github_login}"
  end
end
