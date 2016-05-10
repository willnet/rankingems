# ## Schema Information
#
# Table name: `downloads`
#
# ### Columns
#
# Name              | Type               | Attributes
# ----------------- | ------------------ | ---------------------------
# **`id`**          | `integer`          | `not null, primary key`
# **`rubygem_id`**  | `integer`          | `not null`
# **`count`**       | `integer`          | `default(0), not null`
# **`created_at`**  | `datetime`         | `not null`
# **`updated_at`**  | `datetime`         | `not null`
#
# ### Indexes
#
# * `index_downloads_on_rubygem_id`:
#     * **`rubygem_id`**
#

class Download < ApplicationRecord
  belongs_to :rubygem
end
