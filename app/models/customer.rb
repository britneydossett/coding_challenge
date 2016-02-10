class Customer < ActiveRecord::Base

  has_many :tasks, dependent: :destroy

  before_save { email.downcase! }

  validates :name, presence: true, length: { maximum: 100 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 80 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  validate :phone_pass

  def set_timezone
    Time.zone = current_customer.timezone if current_customer
  end

  def phone_pass
    if phone.present? and not phone.match(/\(?[0-9]{3}\)?-[0-9]{3}-[0-9]{4}/)
      errors.add :phone, "must be in the xxx-xxx-xxxx format"
    end
  end

  def to_s
    email
  end
end
