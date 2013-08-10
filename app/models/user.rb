class User < ActiveRecord::Base

  attr_accessor :login

  devise :omniauthable, :omniauth_providers => [:facebook, :twitter]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:login]

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["username = :value OR lower(email) = :value", { :value => login }]).first
    else
      where(conditions).first
    end
  end

  def email_required?
    false
  end

end
