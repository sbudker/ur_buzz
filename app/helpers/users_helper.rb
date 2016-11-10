module UsersHelper

	def gravatar_for(user, options = { size: 80 })
	    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
	    size = options[:size]
	   	icon_options = ["monsterid", "wavatar"]
	   	default_icon = icon_options[(user.id) % icon_options.length]
	    gravatar_url = "https://secure.gravatar.com/#{default_icon}/#{gravatar_id}?s=#{size}"
	    image_tag(gravatar_url, alt: user.name, class: "gravatar")
	end

end
