module ApplicationHelper

	def formfield_class_and_symbol(model, field)
		html = ""
		if model.validated
  			if model.errors[field].empty?
  				html << '<span class="glyphicon glyphicon-ok form-control-feedback"></span>'
  			else 
  				html << '<span class="glyphicon glyphicon-remove form-control-feedback"></span>'
  				html << '<div class="alert alert-danger alert-dismissible" role="alert">' 
  				html <<	'<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>' 
	    	  	html << model.errors[field].join(", ")
	    	  	html << '</div>'
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
