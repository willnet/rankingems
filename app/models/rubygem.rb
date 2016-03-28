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
  class << self
    ATTRIBUTES_FROM_API = %w(
      name version authors project_uri gem_uri
      homepage_uri wiki_uri documentation_uri mailing_list_uri source_code_uri
      bug_tracker_uri licenses
    )

    def latest_update!
      updated_gems_from_api = Gems.just_updated
      updating_gems = updated_gems_from_api.reject do |gem|
        where(name: gem['name'], version: gem['version']).exists?
      end
      updating_gems.each do |gem|
        rubygem = find_or_initialize_by(name: gem['name'])
        ATTRIBUTES_FROM_API.each do |attr|
          rubygem.send("#{attr}=", gem[attr])
        end
        rubygem.save!
      end
    end
  end
end
