Devise.setup do |config|

  # config.secret_key = 'e4e67cf4cd3b03d18f5484e94b55eb012817254f99dafa126d6dd6b6ced7ea89d23b2d92d37b88c4377719300a280566395c1b52d7cd3332f019ba37de616560'
  # config.pepper = '55fcafc6662181b1839520d8cc874b284b7fed45c199c9b2dda454ae5a650c92a500c2e569cb0beec0ca90898d255471a9a6826e09da57bd24cc8dda333ebb6f'

  config.mailer_sender = 'haslo@haslo.ch'

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [ :email ]
  config.strip_whitespace_keys = [ :email ]

  # config.http_authenticatable_on_xhr = true

  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10

  config.reconfirmable = true

  # config.remember_for = 2.weeks
  config.expire_all_remember_me_on_sign_out = true

  config.password_length = 8..128
  config.email_regexp = /\A[^@]+@[^@]+\z/
  config.timeout_in = 30.minutes

  config.lock_strategy = :failed_attempts
  config.unlock_strategy = :both
  config.maximum_attempts = 20
  config.unlock_in = 1.hour
  config.last_attempt_warning = true

  config.reset_password_within = 6.hours

  config.sign_out_via = :delete

  # ==> OmniAuth
  # Add a new OmniAuth provider. Check the wiki for more information on setting
  # up on your models and hooks.
  # config.omniauth :github, 'APP_ID', 'APP_SECRET', scope: 'user,public_repo'
  # config.omniauth_path_prefix = '/my_engine/users/auth'

end
