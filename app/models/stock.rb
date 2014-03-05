class Stock < ActiveRecord::Base

	validates :name, presence: true
  	validates :volume, presence: true, numericality: true

  	belongs_to :country
  	belongs_to :industry
  	belongs_to :user

  # def self.search search_term
  #   where("title LIKE :search", search: "%#{search_term}%")
  # end
end
