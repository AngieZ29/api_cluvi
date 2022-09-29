class Api::V1::ShortenersController < ApplicationController
  def index
  end

  def create
    alexa = RestClient::Request.execute(
      method: :get,
      url: "https://awis.api.alexa.com/api?Action=UrlInfo&ResponseGroup=Rank&Output=json &Url=#{params['url_origin']}",
      headers:
        {
          'Accept' => 'application/json',
          'x-api-key' => '8T7SlYd7Tp16a9VPBovC26LXGhosXjeM97CLbUUv'
        }
    )

    doc = Nokogiri::XML(alexa)
    obj = doc.xpath("//TrafficData//Rank")[0].text
    @short = Shortener.new(url: params['url_origin'], counter: 0, alexa_rank: obj)

    @short.save

    render json: @short
  end
end
