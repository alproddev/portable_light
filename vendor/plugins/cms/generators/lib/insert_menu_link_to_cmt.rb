Rails::Generator::Commands::Create.class_eval do
  def insert_menu_link_to_cmt(title, table_name)
    sentinel = '<ul class="menu">'
    logger.add_layout "Add #{title} CMT menu link to Admin layout"
    unless options[:pretend]
      gsub_file 'app/views/layouts/admin.html.erb', /(#{Regexp.escape(sentinel)})/mi do |match|
        %{#{match}\n      <li><%= menu_link_to "#{title}", admin_#{table_name}_path, '#{table_name}' %></li>\n}
      end
    end
  end
end

Rails::Generator::Commands::Destroy.class_eval do
  def insert_menu_link_to_cmt(title, table_name)
    look_for = %{      <li><%= menu_link_to "#{title}", admin_#{table_name}_path, '#{table_name}' %></li>\n}
    logger.remove_layout "Remove #{title} CMT menu link to Admin layout"
    unless options[:pretend]
      gsub_file 'app/views/layouts/admin.html.erb', /(#{Regexp.escape(look_for)})/mi, ""
    end
  end
end

Rails::Generator::Commands::List.class_eval do
  def insert_menu_link_to_cmt(title, table_name)
    logger.add_layout "Add #{title} CMT menu link to Admin layout"
  end
end
