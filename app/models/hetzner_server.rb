# frozen_string_literal: true

# ## Schema Information
#
# Table name: `hetzner_servers`
#
# ### Columns
#
# Name              | Type               | Attributes
# ----------------- | ------------------ | ---------------------------
# **`id`**          | `bigint(8)`        | `not null, primary key`
# **`datacentre`**  | `string`           |
# **`ipv4`**        | `string`           |
# **`ipv6`**        | `string`           |
# **`name`**        | `string`           |
# **`number`**      | `integer`          |
# **`product`**     | `string`           |
# **`status`**      | `string`           |
# **`created_at`**  | `datetime`         | `not null`
# **`updated_at`**  | `datetime`         | `not null`
#
# ### Indexes
#
# * `index_hetzner_servers_on_number`:
#     * **`number`**
#

class HetznerServer < ApplicationRecord
end
