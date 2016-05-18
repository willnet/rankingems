# ## Schema Information
#
# Table name: `suggestions`
#
# ### Columns
#
# Name              | Type               | Attributes
# ----------------- | ------------------ | ---------------------------
# **`id`**          | `integer`          | `not null, primary key`
# **`rubygem_id`**  | `integer`          |
# **`user_id`**     | `integer`          |
# **`category`**    | `string`           | `not null`
# **`created_at`**  | `datetime`         | `not null`
# **`updated_at`**  | `datetime`         | `not null`
#
# ### Indexes
#
# * `index_suggestions_on_rubygem_id`:
#     * **`rubygem_id`**
# * `index_suggestions_on_user_id`:
#     * **`user_id`**
#

class Suggestion < ApplicationRecord
  belongs_to :rubygem
end
