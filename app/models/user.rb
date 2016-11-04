class User < ApplicationRecord
	has_secure_password

	attr_accessor :password_confirmation

	#attr_accessible :account
	validates_confirmation_of :password
end
