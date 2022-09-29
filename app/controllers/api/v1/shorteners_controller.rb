module Api
  module V1
    class ShortenersController < ApplicationController
      def create
        alexa = ::Api::V1::AlexaService.find_rank_alexa(params['url_origin'])
        short = Shortener.create!(url: params['url_origin'], counter: 0, alexa_rank: alexa)

        render json: short
      end

      def show
        short = Shortener.find_by(short_code: params['short_code'])
        if short.nil?
          render json: 'La URL no existe'
        else
          short.update!(counter: short.counter + 1)
          redirect_to short.url
        end
      end
    end
  end
end
