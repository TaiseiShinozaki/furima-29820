FactoryBot.define do
  factory :user do
    nickname {Faker::Internet.username}
    email {Faker::Internet.email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name {"龍之介"}
    last_name {"花輪"}
    first_name_kana {"リュウノスケ"}
    last_name_kana {"ハナワ"}
    birth_date {"1998-12-01"}
  end
end