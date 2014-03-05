class Industry < ActiveRecord::Base

	validates :sector, presence: true, uniqueness: true

	has_many :stocks

end
