FactoryGirl.define do
  factory :claim do
    user
    date { Date.current }
  end
end
