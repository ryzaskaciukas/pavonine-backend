class GymSessionsController < ApplicationController
  include Databound

  private def model
    GymSession
  end
end
