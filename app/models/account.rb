class Account < ActiveRecord::Base
  has_secure_password
	has_and_belongs_to_many :services
  attr_accessible :name, :password, :password_digest, :password_confirmation, :sso_token, :paid
  validates :name, presence: true
  before_save :create_sso_token

  private

    def create_sso_token
      self.sso_token = SecureRandom.urlsafe_base64
    end
end
