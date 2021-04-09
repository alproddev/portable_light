module CrushLovely
  module AdminHelper

    def flash_messages(flash)
      res = String.new
      flash.each do |key, msg|
        res << content_tag(:div, msg, :class => "#{key.to_s}") unless msg.blank?
      end
      res
    end

    def clippy(text, bgcolor='#FFFFFF')
      html = <<-EOF
        <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
                width="110"
                height="14"
                id="clippy" >
        <param name="movie" value="/flash/clippy.swf"/>
        <param name="allowScriptAccess" value="always" />
        <param name="quality" value="high" />
        <param name="scale" value="noscale" />
        <param NAME="FlashVars" value="text=#{text}">
        <param name="bgcolor" value="#{bgcolor}">
        <embed src="/flash/clippy.swf"
               width="110"
               height="14"
               name="clippy"
               quality="high"
               allowScriptAccess="always"
               type="application/x-shockwave-flash"
               pluginspage="http://www.macromedia.com/go/getflashplayer"
               FlashVars="text=#{text}"
               bgcolor="#{bgcolor}"
        />
        </object>
      EOF
    end

    def make_sortable(id, path)
      render :partial => '/admin/shared/make_sortable', :locals => { :id => id, :path => path }
    end

    def toggle_visibility(object, path)
      render :partial => '/admin/shared/toggle_visibility', :locals => { :object => object, :path => path }
    end

    def destroy(object, path)
      render :partial => '/admin/shared/destroy', :locals => { :object => object, :path => path }
    end

    def shared_index(*args)
      columns = args.blank? ? [:name] : args
      render :partial => '/admin/shared/index', :locals => { :columns => columns }
    end

    def edit(object, path, label_text = 'Edit')
      link_to(label_text, path, :id => dom_id(object), :class => "#{dom_class(object, 'edit')} edit")
    end

    def toggle_visibility_submit(object)
      object.is_visible ? content_tag(:p, button_submit_tag("Hide")) : content_tag(:p, button_submit_tag("Show"))
    end

    def button_submit_tag(content)
      content_tag(:button, content, :type => 'submit', :class => 'submit')
    end

    def create_button
      content_tag(:p, button_submit_tag('Create'))
    end

    def update_button
      content_tag(:p, button_submit_tag('Update'))
    end

    def calltoaction(*args)
      result = []
      args.each do |arg|
        result << content_tag(:li, arg)
      end
      content_for(:calltoaction, result.join("\n"))
    end
    alias_method :cta, :calltoaction

    def heading(txt="", &block)
      content_for(:heading, (block_given? ? concat(capture(&block)) : txt))
    end

    def action_table_headings(t)
      t.header :toggle_visibility_action, ''
      t.header :edit_action, ''
      t.header :destroy_action, ''
      t.rows[:id] = "#{resource_class.to_s.downcase}-rows"
    end

    def action_table_rows(row, item)
      row[:id] = "#{resource_class.to_s.downcase}-#{item.id}"
      row.toggle_visibility_action toggle_visibility(item, toggle_visibility_resource_path(item)) 
      row.edit_action              edit(item, edit_resource_path(item))
      row.destroy_action           destroy(item, resource_path(item))
    end

    def is_visible_radio_buttons(form)
      form.input :is_visible, :as => :radio, :label => "Visible?", :collection => [["Yes", true], ["No", false]]
    end

    def singular_resource
      resource_class.to_s.tableize.humanize.titleize.singularize
    end

    def plural_resource
      resource_class.to_s.tableize.humanize.titleize
    end

    def menu_link_to(text, url, active_matches, match_against = controller.controller_name, options = {})
      link_to(text, url, { :title => text }.merge(is_active?(match_against, active_matches)))
    end

    def is_active?(cond1, cond2, res = {:class => 'active'})
      if cond2.is_a?(Array)
        cond2.include?(cond1) ? res : {}
      elsif cond2.is_a?(String) || cond2.is_a?(TrueClass) || cond2.is_a?(FalseClass)
        (cond1 == cond2) ? res : {}
      else
        {}
      end
    end

    def attachment_requirements(options = {})
      result = String.new
      result << attachment_dimensions(options[:dimensions]) + ' in ' if options[:dimensions]
      result << attachment_formats(options[:formats]) + '  format required' if options[:formats]
      result
    end

    def attachment_dimensions(arr)
      if arr.length > 1
        dim = arr.collect { |d| d.to_s + 'px' }.join(' x ')
      else
        dim = arr.first.to_s  + 'px wide'
      end
      content_tag(:strong, 'at least ' + dim)
    end

    def attachment_formats(arr)
      content_tag(:strong, arr.to_sentence(:two_words_connector => ' or ', :last_word_connector => ', or '))
    end

    def image_preview(resource, name)
      content_tag(:li, image_tag(resource.send(name).url)) if resource.send("#{name}?")
    end

    def markdown_preview_for(target)
      %{
        <div class="preview">
          <div class="result"></div>
          <div class="controls">
            <a href="#" class="show" rel="#{target.to_s}">Preview</a>
            <a href="#" class="cancel" rel="#{target.to_s}">Cancel</a>
          </div>
        </div>
      }
    end

  end
end