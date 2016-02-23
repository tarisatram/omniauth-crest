require 'spec_helper'

describe OmniAuth::Strategies::Crest do
  subject do
    args = ['CREST_ID', 'CREST_SECRET']
    OmniAuth::Strategies::Crest.new(*args)
  end

  describe 'client options' do
    it 'should have correct name' do
      expect(subject.options.name).to eq('crest')
    end

    it 'should have correct site' do
      expect(subject.options.client_options.site).to eq('https://login.eveonline.com')
    end

    it 'should have correct authorize url' do
      expect(subject.options.client_options.authorize_path).to eq('oauth/authorize')
    end

    it 'should have correct token url' do
      expect(subject.options.client_options.token_path).to eq('oauth/token')
    end
  end
end
