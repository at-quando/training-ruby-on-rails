# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  user_name       :string
#  email           :string
#  password_digest :string
#  name            :string
#  gender          :integer
#  birthday        :datetime
#  role            :integer          default(0)
#  avatar          :string
#  provider        :string
#  uid             :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord

	enum gender: %w(male female gay less other)
	has_secure_password
	validates :user_name, :email, uniqueness: true
	validates :user_name, :password, presence: true
	validates :email, presence: true, :if => Proc.new{ provider == 'email' } 
	validates :name, length: { in: 6..30 } #length: { minimum:6, maximum:30 } , allow_blank: true
	validate :birthday_validate 
	#validates :uid, uniqueness: { scope: :provider }

	has_many :my_carts, class_name: 'Cart' #Cart is class name, name of model
	has_one :cart
	has_many :orders, through: :my_carts
	has_many :books, through: :orders
	has_many :comments, through: :books

	def birthday_validate
		self.errors.add(:birthday, "more than 16 years old") if (birthday.present? && Time.now - 16.years < birthday)
	end

  def validate_email
    self.email_confirmed = true
    self.confirm_token = nil
  end

  def set_confirmation_token
    if self.confirm_token.blank?
      self.confirm_token =SecureRandom.urlsafe_base64.to_s
    end
  end
end
