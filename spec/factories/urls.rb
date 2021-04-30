FactoryBot.define do
  factory :url do
    base_url { "madeinvote.com" }
    generated_token { "gtoken" }
    factory :short_token_url do
      generated_token { 'ab' }
    end
  end
end
