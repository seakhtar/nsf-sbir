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
      dateStart = params['date_start']
      dateEnd = params['date_end']
      printFields = params['printFields']
      awardeeName = params['awardeeName'] if params['awardeeName']
      offset = 1
      successful_connection = true
      awards = []

      uri = URI('http://api.nsf.gov/services/v1/awards.json')
      company_logs = awardeeName ? "for company #{params['awardeeName']}" : ""

      puts "updating awards for date range #{dateStart} – #{dateEnd} #{company_logs}"

      while successful_connection do
        puts "new awards: #{offset}"
        params = {
          :agency => 'nsf',
          :dateStart => dateStart,
          :dateEnd => dateEnd,
          :printFields => printFields.join(','),
          :offset => offset
        }
        params[:awardeeName] = awardeeName if awardeeName
        uri.query = URI.encode_www_form(params)
        res = Net::HTTP.get_response(uri)
        new_awards = JSON.parse(res.body)['response']['award']
        if awardeeName
          matching_awards = only_matching_awardees(new_awards, awardeeName)
          puts "matching records: #{matching_awards.size}"
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
      awards.flatten
    end
  end
end
