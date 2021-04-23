class MonitoringController < ApplicationController
  def heart_beat
    render json: HealthCheck.heart_beat
  end

  def health_check
    render json: HealthCheck.new.results
  end
end
