require 'net/http'
require 'yaml'

module SiteData
  class AwardsApi

    def only_matching_awardees(new_awards, awardeeName)
      new_awards.select do |a|
        a['awardeeName'] == awardeeName
      end
    end

    def get(params)
      expDateStart = params['active_date'] if params['active_date']
      printFields = params['printFields']
      awardeeName = params['awardeeName'] if params['awardeeName']
      dateStart = params['date_start'] if params['date_start']
      dateEnd = params['date_end'] if params['date_end']
      fundProgramName = params['fundProgramName'] if params['fundProgramName']
      offset = 1
      successful_connection = true
      awards = []

      uri = URI('http://api.nsf.gov/services/v1/awards.json')
      company_logs = awardeeName ? "for company #{params['awardeeName']}" : ""

      puts "expiration start threshhold set to #{expDateStart} #{company_logs}"
      start_time = Time.now.to_i

      while successful_connection do
        puts "new awards: #{offset}"
        params = {
          :agency => 'nsf',
          :printFields => printFields.join(','),
          :offset => offset
        }
        params[:dateStart] = dateStart if dateStart
        params[:dateEnd] = dateEnd if dateEnd
        params[:expDateStart] = expDateStart if expDateStart
        params[:awardeeName] = awardeeName if awardeeName
        params[:fundProgramName] = fundProgramName if fundProgramName
        uri.query = URI.encode_www_form(params)
        res = Net::HTTP.get_response(uri)
        new_awards = JSON.parse(res.body)['response']['award']
        break unless new_awards
        if awardeeName
          matching_awards = only_matching_awardees(new_awards, awardeeName)
          puts "matching records: #{matching_awards.size}".green
          awards_present = res.is_a?(Net::HTTPSuccess) && matching_awards.size == 25
        else
          matching_awards = new_awards
          awards_present = res.is_a?(Net::HTTPSuccess) && !new_awards.empty?
        end

        if matching_awards.any?
          awards << matching_awards
        end

        if awards_present
          offset += 25
        end
        successful_connection = awards_present
      end
      end_time = Time.now.to_i
      puts "Done in #{end_time - start_time} seconds".green
      awards.flatten
    end
  end
end
