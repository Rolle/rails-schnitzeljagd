module ApplicationHelper

	def formfield_class_and_symbol(model, field)
		html = ""
		if model.validated
  			if model.errors[field].empty?
  				html << '<span class="glyphicon glyphicon-ok form-control-feedback"></span>'
  			else 
  				html << '<span class="glyphicon glyphicon-remove form-control-feedback"></span>'
  				html << model.errors[field].join(", ")
  			end
  	 	end
  	 	return html
	end

	def formfield_error_class(model, field)
		if model.validated
			if !model.errors[field].empty?
				'has-error' 
			else
				'has-success'
			end
		end
	end

end
