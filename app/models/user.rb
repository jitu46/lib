class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :login
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
validate :validate_username
validates_format_of :password, with: /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$&*]).{12,}$/, :multiline => true

def validate_username
  if User.where(email: username).exists?
    errors.add(:username, :invalid)
  end
end

def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      elsif conditions.has_key?(:username) || conditions.has_key?(:email)
        where(conditions.to_h).first
      end
end


  has_many :details
end
