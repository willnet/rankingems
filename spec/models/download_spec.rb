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

require 'rails_helper'

RSpec.describe Download, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
