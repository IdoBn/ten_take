source 'https://rubygems.org'

ruby "2.1.4"

gem 'rails', '4.2.0.beta1'

gem 'rails-api'
gem 'active_model_serializers', '~> 0.9.0'
gem 'rack-cors', :require => 'rack/cors'

gem 'carrierwave'
gem "fog"

gem 'devise_token_auth'
gem 'omniauth', '>= 1.0.0'

gem 'spring', :group => :development
gem "letter_opener", :group => :development

group :development, :test do
	gem 'rspec-rails', '~> 3.1.0'
	gem 'factory_girl_rails', '~> 4.4.1'
	gem 'database_cleaner', '~> 1.3.0'
	gem 'ffaker', '~> 1.25.0'
	gem 'rb-fsevent', :require => false if RUBY_PLATFORM	 =~ /darwin/i
	gem 'guard-rspec'
	gem 'shoulda-matchers', '~> 2.7.0'
end

gem 'pg'

gem 'rails_12factor', group: :production



# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano', :group => :development

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
