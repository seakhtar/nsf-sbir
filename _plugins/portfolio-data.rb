require 'yaml'
require 'fileutils'

# Duplicate what we have for awards,
# but substituting file paths to be based on the portfolio config and dataset
# Instead of awards

module SiteData
  class PortfolioData
    attr_reader :path, :basepath, :meta_path, :portfolio, :meta, :site, :config_params, :util

    def initialize(site)
      @basepath = Dir.pwd

      @util = SiteData::AwardsUtility.new(site)
      @site = site
      @config_params = @site.config['portfolio_api']
      @path = File.join(@basepath, '_data', 'portfolio.yml')
      @meta_path = File.join(@basepath, '_data', 'portfolio_meta.yml')
      @portfolio = nil
      @meta = nil

      if File.exists? @path
        @portfolio = YAML.load_file(@path)
      else
        FileUtils.touch(@path)
        @portfolio = YAML.load_file(@path)
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
        puts "new portfolio start date: #{@config_params['date_start']}".green
        consolidated << before
      end

      after = @meta.clone
      if @util.to_date(@config_params['date_end']) > @util.to_date(@meta['date_end'])
        after['date_end'] = @config_params['date_end']
        after['date_end'] = @util.to_date_string(@site.time) if @config_params['update_to_current_time'] == true

        after['date_start'] = @util.to_date_string(@util.to_date(@meta['date_end']) + 1)
        puts "new portfolio end date: #{@config_params['date_end']}".green
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
        puts "the portfolio config is unchanged"
        @portfolio.uniq
      else
        portfolio = configs.map do |config|
          SiteData::AwardsApi.new.get(config)
        end

        if !portfolio.empty? && config_params['reset'] != true
          last = portfolio.pop
          portfolio << @portfolio
          portfolio << last
        end

        portfolio.flatten.uniq
      end
    end

    def update(params, portfolio)
      @util.update_yaml(portfolio, @path)
      update_meta
    end

    def update_meta
      @config_params['last_updated'] = @util.to_date_string(@site.time)
      @util.update_yaml(@config_params, @meta_path)
      @config_params
    end
  end
end
