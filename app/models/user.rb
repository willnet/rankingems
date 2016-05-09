# ## Schema Information
#
# Table name: `users`
#
# ### Columns
#
# Name               | Type               | Attributes
# ------------------ | ------------------ | ---------------------------
# **`id`**           | `integer`          | `not null, primary key`
# **`github_uid`**   | `string`           |
# **`github_name`**  | `string`           |
# **`admin`**        | `boolean`          | `default(FALSE), not null`
# **`created_at`**   | `datetime`         | `not null`
# **`updated_at`**   | `datetime`         | `not null`
#

class User < ApplicationRecord
  def self.find_or_create_from_auth_hash(auth_hash)
    uid = auth_hash[:uid]
    nickname = auth_hash[:info][:nickname]
    find_or_create_by!(
      github_uid: uid,
      github_name: nickname
    )
  end
end
