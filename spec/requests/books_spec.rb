require 'rails_helper'

RSpec.describe "Books", type: :request do
  let(:ruby_microscope) { create(:ruby_microscope) }
  let(:rails_tutorial) { create(:ruby_on_rails_tutorial) }
  let(:agile_web_dev) { create(:agile_web_development) }

  # Putting them in an array make it easier to create them in one line
  let(:books) { [ruby_microscope, rails_tutorial, agile_web_dev] }

  let(:json_body) { JSON.parse(response.body) }

  describe 'GET /api/books' do
    # Before any test, let's create our 3 books
    before { books }

    context 'default behavior' do
      before { get '/api/books' }

      it 'gets HTTP status 200' do
        expect(response.status).to eq 200
      end

      it 'receives a json with the "data" root key' do
        expect(json_body['data']).to_not be nil
      end

      it 'receives all 3 books' do
        expect(json_body['data'].size).to eq 3
      end
    end
  end
end
