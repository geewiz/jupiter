# frozen_string_literal: true

FactoryBot.define do
  factory :hetzner_server do
    number { 1 }
    name { "MyString" }
    ipv4 { "MyString" }
    ipv6 { "MyString" }
  end
  factory :user do
    name { "MyString" }
    email { "MyString" }
  end
end
