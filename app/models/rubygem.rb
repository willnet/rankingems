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
# * `index_rubygems_on_name` (_unique_):
#     * **`name`**
#

class Rubygem < ApplicationRecord
  class << self
    def latest_update!
      GemInfo.just_updated.reject(&:persisted?).each do |gem_info|
        create_or_update!(gem_info)
      end
    end

    def create_or_update_from_name(name)
      gem_info = GemInfo.info(name)
      return if gem_info.nil? || gem_info.persisted?
      create_or_update!(gem_info)
    end

    private

    def create_or_update!(gem_info)
      rubygem = find_or_initialize_by(name: gem_info.name)
      rubygem.attributes = gem_info.attributes
      rubygem.save!
    end
  end
end
