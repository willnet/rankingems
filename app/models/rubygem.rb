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
# **`info`**                        | `string`           |
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
# **`ranking`**                     | `integer`          |
# **`slug`**                        | `string`           |
#
# ### Indexes
#
# * `index_rubygems_on_category_id`:
#     * **`category_id`**
# * `index_rubygems_on_name` (_unique_):
#     * **`name`**
# * `index_rubygems_on_slug` (_unique_):
#     * **`slug`**
#

class Rubygem < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :downloads
  has_many :suggestions
  belongs_to :category, optional: true

  scope :no_category, -> { where(category_id: nil) }

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

    def update_download_count_for_ranking!
      find_each(&:update_download_count_for_ranking!)
    end

    private

    def create_or_update!(gem_info)
      rubygem = find_or_initialize_by(name: gem_info.name)
      rubygem.attributes = gem_info.attributes
      rubygem.save!
    end
  end

  def save_total_download_count!
    download_info = Gems.total_downloads(name)
    # deleted gem return "This rubygem could not be found."
    return if download_info.instance_of? String
    downloads.create!(count: download_info[:total_downloads])
  end

  def update_download_count_for_ranking!
    duration = 1.month
    old_download = downloads.where('created_at >= ?', duration.ago)
                            .order(:created_at).first
    unless old_download
      logger.warn "Batch of Download count maybe something wrong - rubygem#id: #{id}"
      return
    end

    latest_download = downloads.order(created_at: :desc).first
    download_count_in_the_duration = latest_download.count - old_download.count
    update!(download_count_for_ranking: download_count_in_the_duration)
  end
end
