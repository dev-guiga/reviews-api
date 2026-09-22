source "https://rubygems.org"

# Framework
gem "rails", "~> 8.1.3"
gem "bootsnap", require: false

# Database
gem "pg", "~> 1.1"

# Web server
gem "puma", ">= 8.0.2"

# Timezone
gem "tzinfo-data", platforms: %i[windows jruby]

# Rails Solid Stack
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

# Deploy
gem "kamal", require: false
gem "thruster", require: false

# Images
gem "image_processing", "~> 1.2"
gem "ruby-vips", "~> 2.0"

# API
gem "rack-cors"
gem "jbuilder", "~> 2.15"

# Environment
gem "dotenv", "~> 3.2"

# Cache
gem "redis", "~> 6.0"

# Background jobs
gem "sidekiq", "~> 8.1"

# Search and pagination
gem "ransack", "~> 5.0"
gem "kaminari", "~> 1.2"

# Authentication
gem "devise", "~> 5.0"
gem "devise-jwt", "~> 0.13"


group :development, :test do
  # Debug
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"

  # Code quality
  gem "rubocop-rails-omakase", require: false

  # Security
  gem "bundler-audit", require: false
  gem "brakeman", require: false

  # Tests
  gem "rspec-rails", "~> 8.0"
  gem "shoulda-matchers", "~> 8.0"
  gem "factory_bot_rails", "~> 6.4"
  gem "faker", "~> 3.8"

  # Performance
  gem "bullet", "~> 8.2"

  # API documentation
  gem "rswag", "~> 2.17"
end


group :development do
  # Profiling
  gem "rack-mini-profiler", "~> 5.0"

  # Console
  gem "pry-rails", "~> 0.3"

  # Database schema annotations
  gem "annotaterb", "~> 4.25"
end


group :test do
  # Redis mock
  gem "mock_redis", "~> 0.16"
end
