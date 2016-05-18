# ## Schema Information
#
# Table name: `rubygems`
#
# ### Columns
#
# Name                              | Type               | Attributes
# --------------------------------- | ------------------ | ---------------------------
# **`id`**                          | `integer`          | `not null, primary key`
# **`name`**                        | `string`           | `not null`
# **`version`**                     | `string`           | `not null`
# **`authors`**                     | `string`           |
# **`project_uri`**                 | `string`           |
# **`gem_uri`**                     | `string`           |
# **`homepage_uri`**                | `string`           |
# **`wiki_uri`**                    | `string`           |
# **`documentation_uri`**           | `string`           |
# **`mailing_list_uri`**            | `string`           |
# **`source_code_uri`**             | `string`           |
# **`bug_tracker_uri`**             | `string`           |
# **`licenses`**                    | `text`             | `default([]), is an Array`
# **`category_id`**                 | `integer`          |
# **`download_count_for_ranking`**  | `integer`          | `default(0), not null`
# **`created_at`**                  | `datetime`         | `not null`
# **`updated_at`**                  | `datetime`         | `not null`
#
# ### Indexes
#
# * `index_rubygems_on_category_id`:
#     * **`category_id`**
# * `index_rubygems_on_name` (_unique_):
#     * **`name`**
#

require 'rails_helper'

RSpec.describe RubygemsController, :type => :controller do

  describe "GET show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

end
