require 'yaml'
require 'fileutils'

# Duplicate what we have for awards,
# but substituting file paths to be based on the topics config and dataset
# Instead of awards

module SiteData
  class TopicsData
    attr_reader :path, :basepath, :meta_path, :topics, :meta, :site, :config_params, :util

    def initialize(site)
      @basepath = Dir.pwd

      @util = SiteData::AwardsUtility.new(site)
      @site = site
      @config_params = @site.config['topics_api']
      @path = File.join(@basepath, '_data', 'topics.yml')
      @meta_path = File.join(@basepath, '_data', 'topics_meta.yml')
      @tech_topics_path = File.join(@basepath, '_data', 'tech-topics.yml')
      @featured_companies_path = File.join(@basepath, '_data', 'featured-companies.yml')
      @topics = nil
      @meta = nil

      if File.exists? @path
        @topics = YAML.load_file(@path)
      else
        FileUtils.touch(@path)
        @topics = YAML.load_file(@path)
      end

      if File.exists? @meta_path
        @meta = YAML.load_file(@meta_path)
      else
        FileUtils.touch(@meta_path)
        update_meta
        @meta = YAML.load_file(@meta_path)
      end

      if File.exists? @tech_topics_path
        @tech_topics = YAML.load_file(@tech_topics_path)
      else
        FileUtils.touch(@tech_topics_path)
        @tech_topics = YAML.load_file(@tech_topics_path)
      end

      if File.exists? @featured_companies_path
        @featured_companies = YAML.load_file(@featured_companies_path)
      else
        FileUtils.touch(@featured_companies_path)
        @featured_companies = YAML.load_file(@featured_companies_path)
      end
    end


    def consolidate_params
      consolidated = []
      if @config_params['active_date_is_now'] == true
        after = @meta.clone
        time_now = @util.to_date(@site.time)
        time_now_s = @util.to_date_string(@site.time)
        if @util.to_date(time_now) > @util.to_date(@meta['date_end'])
          after['exp_date_end'] = time_now_s

          puts "new portfolio end date: #{time_now_s}".green
          consolidated << after
        end
      end
      consolidated
    end

    # should return something like [ { before }, { current @meta }, { after }]
    def create_params
      if @config_params['reset'] == true
        consolidate_params
      end
    end

    def generate(params)
      configs = [ params ].flatten.compact
      if configs.empty?
        puts "the topics config is unchanged".yellow
        @topics.uniq
      else
        companies = @tech_topics.map { |c| c['companies'] }.flatten.uniq.compact
        featured_companies = @featured_companies.map do |c|
          c['search'] || c['name']
        end
        companies = (companies + @featured_companies).uniq

        topics = configs.map do |config|
          companies.map do |company|
            config['awardeeName'] = company
            SiteData::AwardsApi.new.get(config)
          end
        end

        topics = topics.flatten.uniq

        if !topics.empty? && config_params['reset'] != true
          last = topics.pop
          topics << @topics
          topics << last
        end

        topics.flatten.uniq
      end
    end

    def update(params, topics)
      @util.update_yaml(topics, @path)
      update_meta
    end

    def update_meta
      @config_params['last_updated'] = @util.to_date_string(@site.time)
      @util.update_yaml(@config_params, @meta_path)
      @config_params
    end
  end
end
