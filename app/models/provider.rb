# frozen_string_literal: true

class Provider < ApplicationRecord
  has_many :resource_types, dependent: :destroy
end
