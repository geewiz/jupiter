# frozen_string_literal: true
# ## Schema Information
#
# Table name: `users`
#
# ### Columns
#
# Name                      | Type               | Attributes
# ------------------------- | ------------------ | ---------------------------
# **`id`**                  | `bigint(8)`        | `not null, primary key`
# **`confirmation_token`**  | `string(128)`      |
# **`email`**               | `string`           |
# **`encrypted_password`**  | `string(128)`      |
# **`first_name`**          | `string(30)`       |
# **`last_name`**           | `string(30)`       |
# **`middle_name`**         | `string(30)`       |
# **`remember_token`**      | `string(128)`      |
# **`created_at`**          | `datetime`         | `not null`
# **`updated_at`**          | `datetime`         | `not null`
#
# ### Indexes
#
# * `index_users_on_email`:
#     * **`email`**
# * `index_users_on_remember_token`:
#     * **`remember_token`**
#

class User < ApplicationRecord
  include Clearance::User
end
