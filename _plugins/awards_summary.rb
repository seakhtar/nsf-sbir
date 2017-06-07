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
      @awards_phase_1_path = File.join(@basepath, '_data', 'awards_phase_1.yml')
      @awards_phase_2_path = File.join(@basepath, '_data', 'awards_phase_2.yml')


      @awards = nil
      @awards_data = nil

      if File.exists? @path
        @awards = YAML.load_file(@path).uniq
      else
        FileUtils.touch(@path)
        @awards = YAML.load_file(@path).uniq
      end

      if File.exists? @awards_summary_path
        @awards_summary = YAML.load_file(@awards_summary_path)

      else
        FileUtils.touch(@awards_summary_path)
        @awards_summary = YAML.load_file(@awards_summary_path)
      end

      if File.exists? @awards_summary_path
        @awards_phase_1 = YAML.load_file(@awards_phase_1_path)

      else
        FileUtils.touch(@awards_phase_1_path)
        @awards_phase_1 = YAML.load_file(@awards_phase_1_path)
      end

      if File.exists? @awards_summary_path
        @awards_phase_2 = YAML.load_file(@awards_phase_2_path)

      else
        FileUtils.touch(@awards_phase_2_path)
        @awards_phase_2 = YAML.load_file(@awards_phase_2_path)
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

    def states_count
      states.length.to_i
    end

    def applications_total
      @awards.length
    end

    # Phase 2

    def applications_phase_2
      @awards.select do |a|
        a['fundProgramName'].downcase.include?("phase i")
      end.uniq
    end

    def applications_phase_2_count
      applications_phase_2.size
    end

    def funding_phase_2
      applications_phase_2.map { |a| a['fundsObligatedAmt'].to_f }.inject(0, :+).to_f.round(2)
    end

    def companies_phase_2
      applications_phase_2.map { |a| a['awardeeName'] }.uniq.length.to_i
    end

    def companies_unique_phase_2_percent
      (100 * companies_phase_2.to_f / companies_phase_2.to_f).round(2)
    end

    def funding_per_application_phase_2
      (funding_phase_2 / applications_phase_2_count).round(2)
    end

    def funding_per_company_phase_2
      (funding_phase_2 / companies_phase_2).round(2)
    end

    def states_phase_2
      applications_phase_2.map { |a| a['awardeeStateCode'] }.uniq.sort_by(&:upcase).reject(&:empty?)
    end

    def states_phase_2_count
      states_phase_2.length.to_i
    end

    #  Phase 1

    def applications_phase_1
      applications_phase_2.reject do |a|
        a['fundProgramName'].downcase.include?("phase ii")
      end.uniq
    end

    def applications_phase_1_count
      applications_phase_1.size
    end

    def funding_phase_1
      applications_phase_1.uniq.map { |a| a['fundsObligatedAmt'].to_f }.inject(0, :+).to_f.round(2)
    end

    def companies_phase_1
      applications_phase_1.uniq.map { |a| a['awardeeName'] }.uniq.length.to_i
    end

    def companies_unique_phase_1_percent
      (100 * companies_phase_1.to_f / companies_phase_1.to_f).round(2)
    end

    def funding_per_application_phase_1
      (funding_phase_1 / applications_phase_1_count).round(2)
    end

    def funding_per_company_phase_1
      (funding_phase_1 / companies_phase_1).round(2)
    end

    def states_phase_1
      applications_phase_2.map { |a| a['awardeeStateCode'] }.uniq.sort_by(&:upcase).reject(&:empty?)
    end

    def states_phase_1_count
      states_phase_1.length.to_i
    end

    # Active applications

    def active_start_date
      @util.to_date(@site_config['active_start_date'])
    end

    def active_start_date_string
      @util.to_date_string(active_start_date)
    end

    def active_date_range
      "#{active_start_date_string} – Now"
    end

    def applications_active
      @awards.select do |a|
        expDate = a['expDate'] || a['date']
        @util.to_date(expDate) > active_start_date
      end
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
      @awards_summary['active_start_date_string'] = active_start_date_string
      @awards_summary['active_date_range'] = active_date_range
      @awards_summary['funding_applications_active_total'] = funding_applications_active_total
      @awards_summary['funding_per_active_application'] = funding_per_active_application
      @awards_summary['applications_active_total'] = applications_active_total
      @awards_summary['states'] = states
      @awards_summary['states_count'] = states_count

      # Phase 2
      @awards_phase_2 = applications_phase_2
      @awards_summary['applications_phase_2_count'] = applications_phase_2_count
      @awards_summary['funding_phase_2'] = funding_phase_2
      @awards_summary['companies_phase_2'] = companies_phase_2
      @awards_summary['companies_unique_phase_2_percent'] = companies_unique_phase_2_percent
      @awards_summary['funding_per_company_phase_2'] = funding_per_company_phase_2
      @awards_summary['funding_per_application_phase_2'] = funding_per_application_phase_2
      @awards_summary['states_phase_2_count'] = states_phase_2_count
      # Phase 1

      @awards_phase_1 = applications_phase_1
      @awards_summary['applications_phase_1_count'] = applications_phase_1_count
      @awards_summary['funding_phase_1'] = funding_phase_1
      @awards_summary['companies_phase_1'] = companies_phase_1
      @awards_summary['companies_unique_phase_1_percent'] = companies_unique_phase_1_percent
      @awards_summary['funding_per_company_phase_1'] = funding_per_company_phase_1
      @awards_summary['funding_per_application_phase_1'] = funding_per_application_phase_1
      @awards_summary['states_phase_1_count'] = states_phase_1_count

      @util.update_yaml(@awards_summary, @awards_summary_path)
      @util.update_yaml(@awards_phase_1, @awards_phase_1_path)
      @util.update_yaml(@awards_phase_2, @awards_phase_2_path)
    end

  end
end
