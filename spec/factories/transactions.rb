FactoryBot.define do
  factory :transaction do
    sequence(:transaction_id) { |n| "txn_#{n}" }
    points { 100 }
    status { "completed" }
    association :user
  end
end
