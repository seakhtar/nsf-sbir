require 'yaml'
require 'fileutils'

module SiteData
  class AwardsData
    attr_reader :path, :basepath, :meta_path, :awards, :meta, :site, :config_params, :util

    def initialize(site)
      @basepath = Dir.pwd

      @util = SiteData::AwardsUtility.new(site)
      @site = site
      @config_params = @site.config['awards_api']
      @path = File.join(@basepath, '_data', 'awards.yml')
      @meta_path = File.join(@basepath, '_data', 'awards_meta.yml')
      @awards = nil
      @meta = nil

      if File.exists? @path
        @awards = YAML.load_file(@path)
      else
        FileUtils.touch(@path)
        @awards = YAML.load_file(@path)
      end

      if File.exists? @meta_path
        @meta = YAML.load_file(@meta_path)
      else
        FileUtils.touch(@meta_path)
        update_meta
        @meta = YAML.load_file(@meta_path)
      end
    end

    def consolidate_params
      consolidated = []
      before = @meta.clone
      if @util.to_date(@config_params['date_start']) < @util.to_date(@meta['date_start'])
        before['date_start'] = @config_params['date_start']
        before['date_end'] = @util.to_date_string(@util.to_date(@meta['date_start']) - 1)
        puts "new awards start date: #{@config_params['date_start']}".green
        consolidated << before
      end

      after = @meta.clone
      if @util.to_date(@config_params['date_end']) > @util.to_date(@meta['date_end'])
        after['date_end'] = @config_params['date_end']
        after['date_end'] = @util.to_date_string(@site.time) if @config_params['update_to_current_time'] == true

        after['date_start'] = @util.to_date_string(@util.to_date(@meta['date_end']) + 1)
        puts "new awards end date: #{@config_params['date_end']}".green
        consolidated << after
      end

      consolidated
    end

    # should return something like [ { before }, { current @meta }, { after }]
    def create_params
      if @config_params['reset'] == true
        @config_params
      else
        consolidate_params
      end
    end

    def generate(params)
      configs = [ params ].flatten
      if configs.empty?
        puts "the awards config is unchanged"
        @awards
      else
        awards = configs.map do |config|
          SiteData::AwardsApi.new.get(config)
        end

        if !awards.empty? && config_params['reset'] != true
          last = awards.pop
          awards << @awards
          awards << last
        end

        awards.flatten
      end
    end

    def update(params, awards)
      @util.update_yaml(awards, @path)
      update_meta
    end

    def update_meta
      @config_params['last_updated'] = @util.to_date_string(@site.time)
      @util.update_yaml(@config_params, @meta_path)
      @config_params
    end
  end
end
