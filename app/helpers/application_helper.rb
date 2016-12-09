module ApplicationHelper

	# Dynamically creates full title of webpage
	def full_title(page_title = '')
		base_title = "UR BUZZ"
		if page_title == ''
			return base_title
		else
			return page_title + " | UR BUZZ"
		end
	end

end
