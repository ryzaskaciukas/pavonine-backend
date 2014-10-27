class SubscribersController < ApplicationController
  include Databound

  private def model
    Subscriber
  end
end
