require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AnrTournaments
  class Application < Rails::Application

    config.autoload_paths += %W(#{config.root}/app/services #{config.root}/app/decorators)

    config.time_zone = 'Bern'

    config.i18n.enforce_available_locales = true
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    config.i18n.available_locales = [:en]
    config.i18n.default_locale = :en

    config.assets.precompile << /\.(?:svg|eot|woff|ttf)$/

    config.active_record.raise_in_transactional_callbacks = true

  end
end
