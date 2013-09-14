FactoryGirl.define do
  factory :mary, :class => User do
    name "Mary Doe"
    email "mary@gmail.com"
    password "123456"
    password_confirmation "123456"
    confirmed_at Time.now
  end
end

FactoryGirl.define do
  factory :mary_nao_confirmada, :class => User do
    name "Mary Doe"
    email "mary@gmail.com"
    password "123456"
    password_confirmation "123456"
  end
end

FactoryGirl.define do
  factory :suse, :class => User do
    id 3
    name "Suse Doe"
    email "suse@gmail.com"
    password "123456"
    password_confirmation "123456"
    confirmed_at Time.now
  end
end