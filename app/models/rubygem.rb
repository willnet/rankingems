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
    ATTRIBUTES_FROM_API = %w(
      name version authors project_uri gem_uri
      homepage_uri wiki_uri documentation_uri mailing_list_uri source_code_uri
      bug_tracker_uri licenses
    )

    def latest_update!
      updated_gems_from_api = Gems.just_updated
      updating_gems = updated_gems_from_api.reject do |gem_info|
        where(name: gem_info['name'], version: gem_info['version']).exists?
      end
      updating_gems.each do |gem_info|
        create_or_update!(gem_info)
      end
    end

    def create_or_udpate_from_name(name)
      gem_info = Gems.info(name)
      if gem_info.class == String
        puts "'#{name}' is not found"
        return
      end
      if where(name: gem_info['name'], version: gem_info['version']).exists?
        return
      end
      create_or_update!(gem_info)
    end

    private

    def create_or_update!(gem_info)
      rubygem = find_or_initialize_by(name: gem_info['name'])
      ATTRIBUTES_FROM_API.each do |attr|
        rubygem.send("#{attr}=", gem_info[attr])
      end
      rubygem.save!
    end
  end
end
