class User < ActiveRecord::Base
	has_secure_password
	has_many :invitations,foreign_key: :invitee_id
	has_many :events,through: :invitations
	validates :fname, presence: :true, length: { minimum: 3 }
	validates :lname, presence: :true, length: { minimum: 3 }
	validates :username, presence: :true, length: { minimum: 3 }
	validates :email, presence: :true, length: { minimum: 3 }
	validates :phoneno, presence: :true
end
