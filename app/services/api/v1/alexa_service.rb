module Api
  module V1
    class AlexaService
      def self.find_rank_alexa(param)
        response = RestClient::Request.execute(
          method: :get,
          url: "https://awis.api.alexa.com/api?Action=UrlInfo&ResponseGroup=Rank&Output=json &Url=#{param}",
          headers:
            {
              'Accept' => 'application/json',
              'x-api-key' => '8T7SlYd7Tp16a9VPBovC26LXGhosXjeM97CLbUUv'
            }
        )

        Nokogiri::XML(response).xpath('//TrafficData//Rank')[0].text
      end
    end
  end
end
