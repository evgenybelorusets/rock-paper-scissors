require File.expand_path('../boot', __FILE__)

require "action_controller/railtie"
require "sprockets/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RockPaperScissors
  class Application < Rails::Application
    config.i18n.default_locale = :en
    config.autoload_paths += %W(#{config.root}/services)
    config.autoload_paths += %W(#{config.root}/exceptions)
  end
end
