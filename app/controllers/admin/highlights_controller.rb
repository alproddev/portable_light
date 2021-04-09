class Admin::HighlightsController < AdminController
  cache_sweeper :highlight_sweeper
end
