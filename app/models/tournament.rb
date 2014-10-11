class Tournament < ActiveRecord::Base

  validates :title, :description, :tournament_start, presence: true
  validate :signup_url_must_look_legit
  before_create :create_admin_key

  private

  def create_admin_key
    self.admin_key = loop do
      key = SecureRandom.urlsafe_base64(20)
      break key unless Tournament.exists?(admin_key: key)
    end
  end

  def signup_url_must_look_legit
    # TODO - fetch contents, look for "android" or "netrunner"
  end

end
