module HomeHelper
	def resource_name
	    :mi_user
	end
	 
	def resource
		@resource ||= MiUser.new
	end

	def devise_mapping
		@devise_mapping ||= Devise.mappings[:MiUser]
	end
end
