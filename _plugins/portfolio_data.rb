require 'yaml'
require 'fileutils'

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
      @tech_topics_path = File.join(@basepath, '_data', 'tech-topics.yml')
      @featured_companies_path = File.join(@basepath, '_data', 'featured-companies.yml')
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

    def coerce_list(list)
      return unless list && list.any?
      list.map do |c|
        list = c.class == Hash ? c.values : c['name']
      end.flatten
    end

    def find_company(company)
      if company.class == Hash
        company.delete('allow_recent')
        company.values
      else
        company['name']
      end
    end

    def allow_recent_all?
      @config_params['allow_recent_all']
    end

    def generate(params)
      configs = [ params ].flatten.compact
      if configs.empty?
        puts "the portfolio config is unchanged".yellow
        @portfolio.uniq
      else
        tech_topic_companies = configs.map do |config|
          @tech_topics.map do |co|
            if co['companies']
              co['companies'].map do |company|
                company_recent = company['allow_recent']
                find_company(company).map do |c|
                  config['awardeeName'] = c
                  config['allow_recent'] = company_recent unless company_recent.nil?
                  config['allow_recent'] = allow_recent_all? unless allow_recent_all?.nil?
                  SiteData::AwardsApi.new.get(config)
                end
              end
            end
          end
        end.flatten.uniq.compact

        featured_companies = configs.map do |config|
          @featured_companies.map do |co|
            company_recent = co['allow_recent']
            find_company(co).map do |c|
              config['awardeeName'] = c
              config['allow_recent'] = company_recent unless company_recent.nil?
              config['allow_recent'] = allow_recent_all? unless allow_recent_all?.nil?
              SiteData::AwardsApi.new.get(config)
            end
          end
        end.flatten.uniq.compact
        portfolio = (tech_topic_companies + featured_companies)
        portfolio = portfolio.flatten.uniq

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
