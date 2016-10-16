class User < ActiveRecord::Base

  # Encrypted Attributes
  attr_encrypted :current_sign_in_ip, random_iv: true
  attr_encrypted :last_sign_in_ip, random_iv: true
  attr_encrypted :name, random_iv: true
  attr_encrypted :initials, random_iv: true

  # FIXME - DRY up, repeated in Story model
  JSON_ATTRIBUTES = ["id", "name", "initials", "email"]

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Flag used to identify if the user was found or created from find_or_create
  attr_accessor :was_created

  has_and_belongs_to_many :projects, -> { uniq }

  before_validation :set_random_password_if_blank

  validates :name, :presence => true
  validates :initials, :presence => true

  def password_required?
    # Password is required if it is being set, but not for new records
    if !persisted?
      false
    else
      !password.nil? || !password_confirmation.nil?
    end
  end

  def to_s
    "#{name} (#{initials}) <#{email}>"
  end

  def set_random_password_if_blank
    if new_record? && self.password.blank? && self.password_confirmation.blank?
      self.password = self.password_confirmation = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{email}--")[0,8]
    end
  end

  # Sets :reset_password_token encrypted by Devise
  # returns the raw token to pass into mailer
  def set_reset_password_token
    raw, enc = Devise.token_generator.generate(self.class, :reset_password_token)
    self.reset_password_token   = enc
    self.reset_password_sent_at = Time.now.utc
    self.save(:validate => false)
    raw
  end

  def as_json(options = {})
    json = super(:only => JSON_ATTRIBUTES)
    user = json["user"]
    user = user.reverse_merge("name" => self.name, "initials" => self.initials)
    json["user"] = user
    json
  end
end
