class Stock < ApplicationRecord
	def self.icarus
		where('rank > ? AND mom > ?', 90,90)
	end

	def self.rising
		where('rank > ? AND mom > ?', 90,50)
	end

	def self.bargain
		where('rank > ? AND mom < ?', 90,30)
	end

	def self.caution
		where('rank < ? AND mom < ?', 80,20)
	end
	

	#def good?
	#	rank > 90 && mom > 70
	#end
end
