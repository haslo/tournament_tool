class Tournament < ActiveRecord::Base

  validates :title, presence: true
  validate :signup_url_must_look_legit
  before_create :create_keys

  private

  def create_keys
    self.admin_key = loop do
      key = SecureRandom.urlsafe_base64(20)
      break key unless Tournament.exists?(admin_key: key)
    end
    self.show_key = loop do
      key = SecureRandom.urlsafe_base64(8)
      break key unless Tournament.exists?(show_key: key)
    end
  end

  def signup_url_must_look_legit
    # TODO - fetch contents, look for "android" or "netrunner"
  end

end
