FactoryBot.define do
  factory :order_address do
    token {"tok_abcdefghijk00000000000000000"}
    post_code {"210-1234"}
    prefecture_id {2}
    city {"札幌市"}
    town {"中央区"}
    phone_number {"09012345678"}
  end
end
