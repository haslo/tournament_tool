require 'rqrcode'

class Tournament < ActiveRecord::Base

  validates :title, presence: true
  validate :signup_url_must_look_legit
  before_create :create_keys

  def show_qr_code
    RQRCode::QRCode.new(Rails.application.routes.url_helpers.tournament_url(id: show_key))
  end

  def admin_qr_code
    RQRCode::QRCode.new(Rails.application.routes.url_helpers.tournament_url(id: admin_key))
  end

  private

  def create_keys
    self.admin_key = loop do
      key = SecureRandom.urlsafe_base64(20)
      break key unless Tournament.exists?(admin_key: key)
    end
    self.show_key = loop do
      key = SecureRandom.urlsafe_base64(10)
      break key unless key =~ /[\-|_]/ || Tournament.exists?(show_key: key)
    end
  end

  def signup_url_must_look_legit
    # TODO - fetch contents, look for "android" or "netrunner"
  end

end
