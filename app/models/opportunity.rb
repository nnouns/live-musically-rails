class Opportunity < ApplicationRecord
	belongs_to :employer, :class_name => 'User'
	has_many :artist_opportunities, dependent: :destroy
	has_many :artists, :through => :artist_opportunities, source: :user
	has_many :submissions
	has_one :venue, dependent: :destroy

	scope :by_date, -> { order('event_end_date ASC, opportunities.id DESC') }
end
