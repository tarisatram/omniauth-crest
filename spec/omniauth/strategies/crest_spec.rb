require 'spec_helper'

describe OmniAuth::Crest do
  let(:access_token) { stub('AccessToken', :options => {}) }
  let(:parsed_response) { stub('ParsedResponse') }
  let(:response) { stub('Response', :parsed => parsed_response) }

  let(:enterprise_site)          { 'https://login.example.com' }
  let(:enterprise) do
    OmniAuth::Strategies::GitHub.new('CREST_KEY', 'CREST_SECRET',
        {
            :client_options => {
                :site => enterprise_site
            }
        }
    )
  end

  #it 'has a version number' do
  #  expect(OmniAuth::Crest::VERSION).not_to be nil
  #end

  subject do
    OmniAuth::Crest.new({})
  end

  before(:each) do
    subject.stub!(:access_token).and_return(access_token)
  end

end
