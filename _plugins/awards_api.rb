require 'net/http'
require 'yaml'

module SiteData
  class AwardsApi

    def get(params)
      dateStart = params['date_start']
      dateEnd = params['date_end']
      offset = 1
      successful_connection = true
      awards = []

      uri = URI('http://api.nsf.gov/services/v1/awards.json')
      puts "updating awards for date range #{dateStart} – #{dateEnd}"

      while successful_connection do
        puts "new awards: #{offset}"
        params = { :agency => 'nsf', :dateStart => dateStart, :dateEnd => dateEnd, :offset => offset }
        uri.query = URI.encode_www_form(params)

        res = Net::HTTP.get_response(uri)
        awards_present = res.is_a?(Net::HTTPSuccess) && !JSON.parse(res.body)['response']['award'].empty?
        if awards_present
          awards << JSON.parse(res.body)['response']['award']
          offset += 25
        end
        successful_connection = awards_present
      end
      awards.flatten
    end
  end
end
