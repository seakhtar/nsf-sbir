require 'yaml'
require 'fileutils'

module SiteData
  class AwardsUtility
    attr_reader :site

    def initialize(site)
      @site = site
    end

    def update_yaml(new_obj, path)
      new_yaml = YAML.dump(new_obj) << "---\n\n"
      puts "updating file #{path}"
      File.write(path, new_yaml) if File.exists? path
    end

    def to_date_string(date_obj)
      DateTime.parse(date_obj.to_s).strftime('%m/%d/%Y')
    end

    def to_date(date_string)
      date_string = to_date_string(date_string) unless date_string.class == String
      DateTime.strptime(date_string, '%m/%d/%Y')
    end

    def date_add(date, number)
      to_date_string(to_date(date) + number)
    end

    def date_now
      to_date_string(@site.time)
    end

    def date_subtract(date, number)
      to_date_string(to_date(date) - number)
    end

    def date_past(number)
      to_date(@site.time) - number
    end
  end
end
