module CrushLovely

  module FormHelper

    def crush_lovely_form_for(name, object = nil, options = {}, &proc)
      concat("\n<div class=\"cl_form\">\n")
      form_for(name, object, options, &proc)
      concat("\n</div>\n")
    end
    alias_method :cl_form_for, :crush_lovely_form_for
  end

end
