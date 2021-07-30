FactoryBot.define do
  factory :order_address do
    token                   {200}
    user_id                 { 1 }
    item_id                 { 1 }
    postal_code             {"123-4567"}
    prefecture_id           { 1 }
    city                    {1}
    house_number            {1}
    phone_number            {12345678910}   
  end
end