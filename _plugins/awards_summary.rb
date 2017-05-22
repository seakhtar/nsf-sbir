require 'yaml'
require 'fileutils'

module SiteData
  class AwardsSummary
    attr_reader :path, :basepath, :awards, :awards_summary, :util, :site_config

    def initialize(site)
      @basepath = Dir.pwd

      @site_config = site.config['awards_api']
      @util = SiteData::AwardsUtility.new(site)
      @path = File.join(@basepath, '_data', 'awards.yml')
      @meta_path = File.join(@basepath, '_data', 'awards_meta.yml')
      @awards_summary_path = File.join(@basepath, '_data', 'awards_summary.yml')
      @awards = nil
      @awards_data = nil

      if File.exists? @path
        @awards = YAML.load_file(@path)
      else
        FileUtils.touch(@path)
        @awards = YAML.load_file(@path)
      end

      if File.exists? @awards_summary_path
        @awards_summary = YAML.load_file(@awards_summary_path)

      else
        FileUtils.touch(@awards_summary_path)
        @awards_summary = YAML.load_file(@awards_summary_path)
      end
    end

    def companies_total
      @awards.map { |a| a['awardeeName'] }.uniq.length.to_i
    end

    def funding_total
      @awards.map { |a| a['fundsObligatedAmt'].to_f }.inject(0, :+).to_f.round(2)
    end

    def funding_per_company
      (funding_total / companies_total).round(2)
    end

    def states
      @awards.map { |a| a['awardeeStateCode'] }.uniq.sort_by(&:upcase).reject(&:empty?)
    end

    def states_total
      states.length.to_i
    end

    def applications_total
      @awards.length
    end

    def active_date_start
      @util.to_date(@site_config['active_date_start'])
    end

    def active_date_start_string
      @util.to_date_string(active_date_start)
    end

    def active_date_range
      "#{active_date_start_string} – Now"
    end

    def applications_active
      @awards.select { |a| @util.to_date(a['date']) > active_date_start }
    end

    def funding_applications_active_total
      applications_active.map { |a| a['fundsObligatedAmt'].to_f }.inject(0, :+).to_f.round(2)
    end

    def funding_applications_active_total
      applications_active.map { |a| a['fundsObligatedAmt'].to_f }.inject(0, :+).to_f.round(2)
    end

    def applications_active_total
      applications_active.length
    end

    def funding_per_active_application
      (funding_applications_active_total / applications_active_total).round(2)
    end

    # generates a summary of date based on _data/awards.yml
    def generate
      @awards_summary['companies_total'] = companies_total
      @awards_summary['funding_total'] = funding_total
      @awards_summary['funding_per_company'] = funding_per_company
      @awards_summary['applications_total'] = applications_total
      @awards_summary['applications_active'] = applications_active
      @awards_summary['active_date_start_string'] = active_date_start_string
      @awards_summary['active_date_range'] = active_date_range
      @awards_summary['funding_applications_active_total'] = funding_applications_active_total
      @awards_summary['funding_per_active_application'] = funding_per_active_application
      @awards_summary['applications_active_total'] = applications_active_total
      @awards_summary['states'] = states
      @awards_summary['states_total'] = states_total
      @util.update_yaml(@awards_summary, @awards_summary_path)
    end

  end
end
