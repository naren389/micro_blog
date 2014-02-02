module UsersHelper
	
	# Returns the gravatar for the given user
    def gravatar_for(user)
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		#gravatar_url = "https://secure.gravatar.com/avatars/#{gravatar_id}.png"
		gravatar_url = "rails.png"
		image_tag(gravatar_url, atlt: user.name, class: "gravatar")
	end

end
