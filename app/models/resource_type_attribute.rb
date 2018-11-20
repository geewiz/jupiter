# frozen_string_literal: true

class ResourceTypeAttribute < ApplicationRecord
  belongs_to :resource_type
  has_many :resource_attributes

  delegate :name, to: :resource_type, prefix: true
end
