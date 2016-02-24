# OmniAuth Crest

An OmniAuth strategy for authenticating to the EVE Online CREST API. To use it, you'll need to sign up for an OAuth2 Application ID and Secret on the [EVE: Developers](https://developers.eveonline.com) page.

[![Build Status](https://travis-ci.org/tarisatram/omniauth-crest.svg?branch=master)](https://travis-ci.org/tarisatram/omniauth-crest) [![Code Climate](https://codeclimate.com/github/tarisatram/omniauth-crest/badges/gpa.svg)](https://codeclimate.com/github/tarisatram/omniauth-crest)

## Basic Usage
Only provides verification of the character signing into the website.

    use OmniAuth::Builder do
      provider :crest, ENV['CREST_ID'], ENV['CREST_SECRET']
    end

## Scopes

CREST allows you to set scopes to determine what protected data access_tokens will be able to access once authenticated. 

    use OmniAuth::Builder do
      provider :crest, ENV['CREST_ID'], ENV['CREST_SECRET'], scope: "characterFittingsRead characterFittingsWrite"
    end

More info on [Scopes](https://eveonline-third-party-documentation.readthedocs.org/en/latest/crest/authentication/).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tarisatram/omniauth-crest.


## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

