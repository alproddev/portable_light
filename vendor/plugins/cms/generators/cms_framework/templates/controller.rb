class AdminController < InheritedResources::Base
  include InheritedResources::DSL

  layout 'admin'

  before_filter :users_only

  helper_method :toggle_visibility_resource_path, :toggle_visibility_resource_url, :sort_collection_path, :sort_collection_url
  defaults :route_prefix => 'admin'

  def home
    render
  end

  def markdown_preview
    respond_to do |wants|
      wants.html { redirect_to(root_url) }
      wants.js do
        if params[:text]
          @preview = RDiscount.new(params[:text]).to_html
          render :json => @preview, :status => 200
        else
          render :nothing => true, :status => 200
        end
      end
    end
  end

  create! do |success, failure|
    success.html { redirect_to edit_resource_url }
    failure.html { render 'new' }
  end

  update! do |success, failure|
    success.html { redirect_to edit_resource_url }
    failure.html { render 'edit' }
  end

  # PUT /resources/sort
  def sort(options={}, &block)
    collection.each do |object|
      if position = params["#{resource_class.to_s.downcase}-rows".to_sym].index(object.id.to_s)
        object.update_attribute(:position, position + 1) unless object.position == position + 1
      end
    end
    respond_to do |format|
      format.html { redirect_to collection_url }
      format.js { render :nothing => true, :status => 200 }
    end
  end

  # PUT /resources/1/toggle_visibility
  def toggle_visibility(options={}, &block)
    object = resource

    if object.toggle_visibility!
      set_flash_message!(:notice, '{{resource_name}} visibility was successfully updated.')
      options[:location] ||= collection_url rescue nil
      respond_to do |format|
        format.html { redirect_to collection_url }
        format.js { render :nothing => true, :status => 200 }
      end
    else
      set_flash_message!(:error, '{{resource_name}} visibility could not be updated.  Please fix the errors below.')
      respond_to do |format|
        format.html { render 'edit' }
        format.js { render :nothing => true, :status => 422 }
      end
    end
  end

  protected

  def toggle_visibility_resource_path(resource)
    resource_path(resource) + '/toggle_visibility'
  end

  def toggle_visibility_resource_url(resource)
    resource_url(resource) + '/toggle_visibility'
  end

  def sort_collection_path
    collection_path + '/sort'
  end

  def sort_collection_url
    collection_url + '/sort'
  end
end
