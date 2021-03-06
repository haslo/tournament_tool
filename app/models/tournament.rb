require 'rqrcode'

class Tournament < ActiveRecord::Base

  include Concerns::ModelWithJSONData

  belongs_to :account
  belongs_to :league
  has_many :stages, -> { order(:position) }
  has_many :participants

  acts_as_list scope: :league

  validates :title, :account_id, :type, :tournament_start, presence: true
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
    path = if Rails.env.test?
             'http://haslo.ch'
           else
             Rails.application.routes.url_helpers.tournament_url(id: show_key)
           end

    RQRCode::QRCode.new(path)
  end

  def default_stages_key
    nil
  end

  def create_default_stages
    # TODO override
  end

  def default_minutes_per_break
    10 # TODO override
  end

  def default_minutes_per_round
    60 # TODO override
  end

  def maximum_participants_at(position)
    [
      stages.select{|s| s.position <= position}.map(&:maximum_number_of_participants).reject(&:blank?).min,
      participants.count
    ].reject(&:blank?).min
  end

  def update_stage_times
    stages.order(:position).each do |stage|
      stage.update_times
      stage.save
    end
  end

  private

  def create_show_key
    self.show_key = loop do
      key = SecureRandom.urlsafe_base64(10)
      break key unless key =~ /[\-|_]/ || Tournament.exists?(show_key: key)
    end
  end

end
