# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                 :bigint(8)        not null, primary key
#  email              :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  encrypted_password :string(128)
#  confirmation_token :string(128)
#  remember_token     :string(128)
#  first_name         :string(30)
#  middle_name        :string(30)
#  last_name          :string(30)
#


class User < ApplicationRecord
  include Clearance::User
end
