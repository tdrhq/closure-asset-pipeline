
module ApplicationHelper
  def google_closure_prefix
    Rails.env.production? ? "<script src='/assets/javascripts/closure-library/closure/goog/base.js'></script>" : ""
  end
end
