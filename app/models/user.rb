class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  before_save {self.name = name.split(/\s/).capitalize!.join}

  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
  validates_uniqueness_of :name, case_sensitive: false
  validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
  validates :password, length: { minimum: 6 }, allow_blank: true
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 254 }

   has_secure_password
end
