# frozen_string_literal: true

class ResourceAttribute < ApplicationRecord
  belongs_to :resource
  belongs_to :resource_type_attribute

  delegate :name, to: :resource_type_attribute, prefix: true
end
