class Ranking
  class << self
    def update_all_rankings!
      Category.find_each do |category|
        category
          .rubygems
          .order(download_count_for_ranking: :desc)
          .each.with_index(1) do |rubygem, ranking|
          rubygem.update!(ranking: ranking)
        end
      end
    end
  end
end
