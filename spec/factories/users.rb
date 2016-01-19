FactoryGirl.define do
  factory :user do
    github_login { SecureRandom.hex }
    name "Jane Doe"
  end
end
