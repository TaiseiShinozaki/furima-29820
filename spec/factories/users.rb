FactoryBot.define do
  factory :user do
    nickname {Faker::Internet.username}
    email {Faker::Internet.email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name {"太郎"}
    last_name {"田中"}
    first_name_kana {"タロウ"}
    last_name_kana {"タナカ"}
    birth_date {"1998-12-01"}
  end
end