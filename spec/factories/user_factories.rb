FactoryGirl.define do

  factory :user do
    sequence(:email) {|n| "user_#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
    confirmed_at Time.now

    company
  end

end
