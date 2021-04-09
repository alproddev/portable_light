class VisitorsController < ApplicationController
  def index
    @visitors = IpLookup.distinct_coordinates
    respond_to do |wants|
      wants.xml {
        render :xml => @visitors.to_xml(
          :only => [:lat, :lng],
          :methods => :count,
          :skip_types => true,
          :dasherize => false,
          :indent => 0)
      }
      wants.html { redirect_to home_url and return }
    end
  end
end
