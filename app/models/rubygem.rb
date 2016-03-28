# ## Schema Information
#
# Table name: `rubygems`
#
# ### Columns
#
# Name                     | Type               | Attributes
# ------------------------ | ------------------ | ---------------------------
# **`id`**                 | `integer`          | `not null, primary key`
# **`name`**               | `string`           | `not null`
# **`version`**            | `string`           | `not null`
# **`authors`**            | `string`           |
# **`project_uri`**        | `string`           |
# **`gem_uri`**            | `string`           |
# **`homepage_uri`**       | `string`           |
# **`wiki_uri`**           | `string`           |
# **`documentation_uri`**  | `string`           |
# **`mailing_list_uri`**   | `string`           |
# **`source_code_uri`**    | `string`           |
# **`bug_tracker_uri`**    | `string`           |
# **`licenses`**           | `text`             | `default("{}"), is an Array`
# **`created_at`**         | `datetime`         | `not null`
# **`updated_at`**         | `datetime`         | `not null`
#
# ### Indexes
#
# * `index_rubygems_on_name`:
#     * **`name`**
#

class Rubygem < ApplicationRecord
end
