FactoryGirl.define do
  factory :github_auth, class: OmniAuth::AuthHash do
    skip_create

    transient do
      user { build(:user) }
      name { user.name }
      nickname { user.github_login }
    end

    info do
      {
        name: name,
        nickname: nickname
      }
    end
  end
end
