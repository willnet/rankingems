class DownloadCountWorker
  include Sidekiq::Worker

  def perform
    # TODO: How do we get all gems info with 1 second interval?
    Rubygem.find_each do |rubygem|
      logger.info "[save_total_download_count]rubygem_id: #{rubygem.id}"
      rubygem.save_total_download_count!
      sleep 1
    end
  end
end
