# frozen_string_literal: true

class ResourceType < ApplicationRecord
  belongs_to :provider
  has_many :resources
  has_many :resource_type_attributes

  delegate :name, to: :provider, prefix: true
end
