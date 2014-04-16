module DashboardHelper
	def resource_name
	    :mi_user
	end
	 
	def resource
		@resource ||= current_mi_user
	end

	def devise_mapping
		@devise_mapping ||= Devise.mappings[:MiUser]
	end
end
