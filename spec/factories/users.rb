FactoryGirl.define do
  factory :user do
    github_login { SecureRandom.hex }
    sequence(:name) { |i| "Jane Doe ##{i}" }
  end
end
