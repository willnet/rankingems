# ## Schema Information
#
# Table name: `suggestions`
#
# ### Columns
#
# Name                 | Type               | Attributes
# -------------------- | ------------------ | ---------------------------
# **`id`**             | `integer`          | `not null, primary key`
# **`rubygem_id`**     | `integer`          |
# **`user_id`**        | `integer`          |
# **`category_id`**    | `integer`          |
# **`category_name`**  | `string`           | `not null`
# **`status`**         | `integer`          | `default("init"), not null`
# **`created_at`**     | `datetime`         | `not null`
# **`updated_at`**     | `datetime`         | `not null`
#
# ### Indexes
#
# * `index_suggestions_on_category_id`:
#     * **`category_id`**
# * `index_suggestions_on_rubygem_id`:
#     * **`rubygem_id`**
# * `index_suggestions_on_status`:
#     * **`status`**
# * `index_suggestions_on_user_id`:
#     * **`user_id`**
#

class Suggestion < ApplicationRecord
  belongs_to :rubygem
  belongs_to :user
  belongs_to :category, optional: true

  validates :category_name, presence: true

  enum status: { init: 0, accepted: 10, rejected: 20 }
end
