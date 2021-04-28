FactoryBot.define do
  factory :user do
    sequence(:email) { |i| "charles#{i}@hei.fr" }
    username { 'charles' }
    password { 'aaaaaa' }
  end
end
