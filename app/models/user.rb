class User < ApplicationRecord
	has_secure_password
	#attr_accessible :account, :password, :password_confirmation
	#attr_accessor :password
	#validates :account, :presence => true, :uniqueness => true
	#validates :password, :presence => true, :confirmation => true
	#validates :password_confirmation, :presence => true
	#validates_confirmation_of :password

end
