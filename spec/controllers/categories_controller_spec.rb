# ## Schema Information
#
# Table name: `categories`
#
# ### Columns
#
# Name              | Type               | Attributes
# ----------------- | ------------------ | ---------------------------
# **`id`**          | `integer`          | `not null, primary key`
# **`name`**        | `string`           |
# **`created_at`**  | `datetime`         | `not null`
# **`updated_at`**  | `datetime`         | `not null`
# **`slug`**        | `string`           |
#
# ### Indexes
#
# * `index_categories_on_name` (_unique_):
#     * **`name`**
# * `index_categories_on_slug` (_unique_):
#     * **`slug`**
#

require 'rails_helper'

RSpec.describe CategoriesController, :type => :controller do

  describe "GET show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

end
