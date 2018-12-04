# frozen_string_literal: true

class Resource < ApplicationRecord
  belongs_to :resource_type
  has_many :resource_attributes, dependent: :destroy
end
