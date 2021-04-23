class ApplicationController < ActionController::API
  def health_check
    render HealthCheck.new.results
  end
end
