module AuthenticationHelpers
  def sign_in_on_github(user = FactoryGirl.build(:user))
    github_auth = FactoryGirl.create(:github_auth, user: user)
    OmniAuth.config.mock_auth[:github] = github_auth
  end

  def sign_in(user = FactoryGirl.create(:user))
    Capybara.current_session.cookies[:user_id] = user.id
  end
end

RSpec.configure do |config|
  config.include(AuthenticationHelpers)
end
