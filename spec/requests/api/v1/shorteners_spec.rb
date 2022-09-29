require 'rails_helper'

RSpec.describe "Shorteners", type: :request do
  describe "POST /create" do
    before do
      allow(::Api::V1::AlexaService).to receive(:find_rank_alexa).and_return(14)
    end

    context 'when url is correct' do
      it 'should return 200' do
        post '/api/v1/shorteners', params: { url_origin: Faker::Internet.url }
        expect(response).to have_http_status(200)
      end
    end

    context 'when url is not correct' do
      it 'should return 404' do
        post '/api/v1/shorteners', params: { url_origin: 'htt://enterprise.com' }
        expect(response).to have_http_status(404)
      end
    end
  end

  describe "GET /show" do
    let!(:shortener) { create(:shortener) }

    context 'when short_code is correct' do
      it 'should return 302' do
        get "/#{shortener.short_code}"
        expect(response).to have_http_status(302)
      end
    end

    context 'when short_code is correct' do
      it 'should return URL not exist' do
        get '/123456'
        expect(response.body).to eq('La URL no existe')
      end
    end
  end
end
