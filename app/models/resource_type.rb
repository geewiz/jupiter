# frozen_string_literal: true

class ResourceType < ApplicationRecord
  belongs_to :provider
  has_many :resources, dependent: :destroy
  has_many :resource_type_attributes, dependent: :destroy

  delegate :name, to: :provider, prefix: true
end
