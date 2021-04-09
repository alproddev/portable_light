ActionController::Routing::Routes.draw do |map|
  map.sign_out 'sign_out', :controller => 'user_sessions', :action => 'destroy'
  map.sign_in 'sign_in', :controller => 'user_sessions', :action => 'new'
  map.resources :user_sessions

  map.markdown_preview '/admin/markdown_preview', :controller => 'admin', :action => 'markdown_preview'
  map.admin '/admin', :controller => 'admin', :action => 'home'
  map.namespace(:admin) do |admin|
    admin.resources :highlights, :collection => { :sort => :post }, :member => { :toggle_visibility => :put }
    admin.resources :posts, :collection => { :sort => :post }, :member => { :toggle_visibility => :put }
  end

  map.home '', :controller => 'home', :action => 'index'
  map.about '/about', :controller => 'about', :action => 'index'
  map.history '/history', :controller => 'history', :action => 'index'
  map.profiles '/profiles', :controller => 'profiles', :action => 'index'
  map.projects '/projects', :controller => 'projects', :action => 'index'
  map.contact '/contact', :controller => 'contact', :action => 'index'
  map.brazil '/brazil', :controller => 'brazil', :action => 'brazil'
  map.haiti '/haiti', :controller => 'haiti', :action => 'haiti'
  map.kenya '/kenya', :controller => 'kenya', :action => 'kenya'
  map.nicaragua '/nicaragua', :controller => 'nicaragua', :action => 'nicaragua'
  map.venezuela '/venezuela', :controller => 'venezuela', :action => 'venezuela'
  map.southafrica '/southafrica', :controller => 'southafrica', :action => 'southafrica'
  map.mexico07 '/mexico07', :controller => 'mexico07', :action => 'mexico07'
  map.mexico06 '/mexico06', :controller => 'mexico06', :action => 'mexico06'
  map.posts_page '/news/page/:page', :controller => 'posts', :action => 'index'
  map.posts '/news', :controller => 'posts', :action => 'index'
  map.preview '/admin/preview', :controller => 'admin', :action => 'preview'
  map.admin '/admin', :controller => 'admin', :action => 'index'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.resources :highlights, :only => [:index, :show]
end
