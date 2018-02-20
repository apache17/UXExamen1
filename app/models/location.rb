class Location < ApplicationRecord
    belongs_to :user, optional: true
	has_many :recording, dependent: :destroy

	validates :name, presence: true, length: { minimum: 5 }
end
