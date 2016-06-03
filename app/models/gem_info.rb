class GemInfo
  include ActiveModel::Model

  ATTRIBUTES_FROM_API = %w(
    name version info authors project_uri gem_uri
    homepage_uri wiki_uri documentation_uri mailing_list_uri source_code_uri
    bug_tracker_uri licenses
  ).freeze

  ATTRIBUTES_FROM_API.each do |attr|
    attr_accessor attr
  end

  class << self
    def info(name)
      gem_info = Gems.info(name)
      if gem_info.class == String
        puts "'#{name}' is not found"
        return
      end
      new(attributes_from_hash(gem_info))
    end

    def just_updated
      updated_gems_from_api = Gems.just_updated
      updated_gems_from_api.map do |gem_info|
        new(attributes_from_hash(gem_info))
      end
    end

    def attributes_from_hash(args)
      ATTRIBUTES_FROM_API.each_with_object({}) do |attr, hash|
        hash[attr.to_sym] = args[attr]
      end
    end
  end

  def persisted?
    Rubygem.where(name: name, version: version).exists?
  end

  def attributes
    ATTRIBUTES_FROM_API.each_with_object({}) do |attr, hash|
      hash[attr.to_sym] = send(attr)
    end
  end
end
