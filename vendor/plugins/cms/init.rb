require File.dirname(__FILE__) + '/lib/admin_helper'
require File.dirname(__FILE__) + '/lib/crush_lovely_form_builder'
ActionView::Base.send :include, CrushLovely::FormHelper
ActionView::Base.send :include, CrushLovely::AdminHelper
