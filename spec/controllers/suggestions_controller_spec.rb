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

require 'rails_helper'

RSpec.describe SuggestionsController, :type => :controller do

  describe "GET create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

end
