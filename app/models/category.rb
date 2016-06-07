# ## Schema Information
#
# Table name: `categories`
#
# ### Columns
#
# Name              | Type               | Attributes
# ----------------- | ------------------ | ---------------------------
# **`id`**          | `integer`          | `not null, primary key`
# **`name`**        | `string`           |
# **`created_at`**  | `datetime`         | `not null`
# **`updated_at`**  | `datetime`         | `not null`
# **`slug`**        | `string`           |
#
# ### Indexes
#
# * `index_categories_on_name` (_unique_):
#     * **`name`**
# * `index_categories_on_slug` (_unique_):
#     * **`slug`**
#

class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :rubygems
end
