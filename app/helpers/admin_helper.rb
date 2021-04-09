module AdminHelper

  def link_to_remove_fields(name, form)
    form.input(:_destroy, :as => :hidden, :hint => link_to_function(name, "remove_fields(this)", :class => "btn_remove"))
  end
  
  def link_to_add_fields(name, form, association)
    new_object = form.object.class.reflect_on_association(association).klass.new
    fields = form.semantic_fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :form => builder)
    end
    link_to_function(name, h("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"))
  end

  def boolean_class(boolean, options = {})
    true_class = options[:true] || 'visible'
    false_class = options[:false] || 'hidden'
    boolean ? true_class : false_class
  end

end