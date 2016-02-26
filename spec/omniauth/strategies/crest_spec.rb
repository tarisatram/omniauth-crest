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
      expect(subject.options.client_options.authorize_url).to eq('https://login.eveonline.com/oauth/authorize')
    end

    it 'should have correct token url' do
      expect(subject.options.client_options.token_url).to eq('https://login.eveonline.com/oauth/token')
    end
  end

  describe 'info' do
    before do
      allow(subject).to receive(:raw_info).and_return(raw_info_hash)
    end

    it 'should return the character name' do
      expect(subject.info[:name]).to eq(raw_info_hash['CharacterName'])
    end

    it 'should return the character id' do
      expect(subject.info[:character_id]).to eq(raw_info_hash['CharacterID'])
    end

    it 'should return the access token expiration' do
      expect(subject.info[:expires_on]).to eq(raw_info_hash['ExpiresOn'])
    end

    it 'should return the oauth2 scopes' do
      expect(subject.info[:scopes]).to eq(raw_info_hash['Scopes'])
    end

    it 'should return the token type' do
      expect(subject.info[:token_type]).to eq(raw_info_hash['TokenType'])
    end
  end

  describe 'uid' do
    before do
      allow(subject).to receive(:raw_info).and_return(raw_info_hash)
    end

    it 'should return the CharacterOwnerHash' do
      expect(subject.uid).to eq(raw_info_hash['CharacterOwnerHash'])
    end
  end

  describe '#raw_info' do
    it 'should return raw_info_hash' do
    end
  end

  describe 'extra' do
    before do
      allow(subject).to receive(:raw_info).and_return(raw_info_hash)
    end

    it 'should return the raw_info' do
      expect(subject.extra[:raw_info]).to eq(raw_info_hash)
    end
  end
end

private

def raw_info_hash
  {
    "CharacterID"          => 12345678,
    "CharacterName"        => "Foo Bar",
    "ExpiresOn"            => "2016-02-20T00:00:00",
    "Scopes"               => "characterLocationRead characterNavigationWrite",
    "TokenType"            => "Character",
    "CharacterOwnerHash"   => "1234567890abcdefghijklmnopq",
    "IntellectualProperty" => "EVE"
  }
end

