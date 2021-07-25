FactoryBot.define do
  factory :user do
    nickname                  { 'furima太郎' }
    email                     {Faker::Internet.free_email}
    password                  {Faker::Internet.password(min_length:6)}
    password_confirmation     { password }
    last_name                 {'陸太郎'}
    first_name                {'山田'}
    last_name_kana            { 'リクタロウ' }
    first_name_kana           { 'ヤマダ' }
    birth_date                {Faker::Date.between(from: '1930-1-1',to: '2016-12-31')}
  end
end