require 'rqrcode'

class Tournament < ActiveRecord::Base

  belongs_to :account
  belongs_to :league
  has_many :stages
  has_many :participants

  validates :title, :account_id, :type, presence: true
  before_create :create_show_key

  def self.tournament_types
    [
      Android::NetrunnerTournament
    ]
  end

  def type_name
    self.class.type_name
  end

  def self.type_name
    I18n.t("types.tournaments.#{type_key}")
  end

  def show_qr_code
    RQRCode::QRCode.new(Rails.application.routes.url_helpers.tournament_url(id: show_key))
  end

  private

  def create_show_key
    self.show_key = loop do
      key = SecureRandom.urlsafe_base64(10)
      break key unless key =~ /[\-|_]/ || Tournament.exists?(show_key: key)
    end
  end

end
