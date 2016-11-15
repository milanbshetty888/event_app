class Event < ActiveRecord::Base
	# has_many :users
	belongs_to :owner,class_name: "User"
	has_many :invitees,through: :invitations,foreign_key: :invitee_id
	has_many :invitations
end


