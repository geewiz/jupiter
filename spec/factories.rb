# frozen_string_literal: true

FactoryBot.define do
  factory :resource_attribute do
    resource { "" }
    resource_type_attribute { "" }
    value { "MyString" }
  end
  factory :resource do
    name { "MyString" }
    resource_type { "" }
  end
  factory :resource_type_attribute do
    name { "MyString" }
    resource { "" }
  end
  factory :resource_type do
    name { "MyString" }
    provider { "" }
  end
  factory :provider do
    name { "MyString" }
  end
  factory :user do
    name { "MyString" }
    email { "MyString" }
  end
end
