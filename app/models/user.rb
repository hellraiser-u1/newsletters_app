# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  password_digest :string(255)
#  subscription    :boolean
<<<<<<< HEAD
=======
#  remember_token  :string(255)
>>>>>>> sign-in-out
#

class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation, :subscription
  has_secure_password
  
  has_one :subscriptions
  
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :name, presence: false, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   false,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
<<<<<<< HEAD
  
  
  #validate :check_subscription, :on => :create

  #def check_subscription
  #  if (self.subscription = 1)
  #    errors.add(:money, 'Amount change must be less than money')
  #  end
  #end  
=======


  private
  
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end


>>>>>>> sign-in-out
end


