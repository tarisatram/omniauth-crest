require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Crest < OmniAuth::Strategies::OAuth2
      option :name, 'crest'
      option :client_options, {
        site: 'https://login.eveonline.com',
        authorize_url: 'https://login.eveonline.com/oauth/authorize',
        token_url: 'https://login.eveonline.com/oauth/token'
      }

      def raw_info
        @raw_info ||= access_token.get('oauth/verify').parsed
      end

      uid { raw_info['CharacterOwnerHash'] }

      info do 
        { 
          name: raw_info['CharacterName'],
          character_id: raw_info['CharacterID'],
          expires_on: raw_info['ExpiresOn'],
          scopes: raw_info['Scopes'],
          token_type: raw_info['TokenType']
        }
      end

      extra do
        { raw_info: raw_info }
      end
    end
  end
end
