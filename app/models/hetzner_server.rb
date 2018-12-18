# frozen_string_literal: true

# == Schema Information
#
# Table name: hetzner_servers
#
#  id         :bigint(8)        not null, primary key
#  number     :integer
#  name       :string
#  ipv4       :string
#  ipv6       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product    :string
#  status     :string
#  datacentre :string
#

class HetznerServer < ApplicationRecord
end
