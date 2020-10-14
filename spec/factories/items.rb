FactoryBot.define do
  factory :item do
    user_id {"4"}
    name {"写真"}
    description {"写真です"}
    category_id {"2"}
    condition_id {"2"}
    postage_payer_id {"2"}
    prefecture_id {"2"}
    handling_time_id {"2"}
    price {"500000"} 
  end
end
