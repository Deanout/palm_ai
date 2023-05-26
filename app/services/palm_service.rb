# Service for interacting with the Palm API
module PalmService
    extend ActiveSupport::Concern
    def initialize
        @conn = Faraday.new(url: 'http://127.0.0.1:5000/')
    end 


    def post_to_palm(prompt)
        response = @conn.post('/generate') do |req|
            req.headers['Content-Type'] = 'application/json'
            req.body = { prompt: prompt }.to_json
        end
        JSON.parse(response.body)[0]
      end
end