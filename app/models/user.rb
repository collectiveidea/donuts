class User < ActiveRecord::Base
  validates :github_login, presence: true, uniqueness: true, strict: true
end
