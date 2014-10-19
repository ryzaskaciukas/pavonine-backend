class SubscribersController < ApplicationController
  include Godfather

  private def model
    Subscriber
  end
end
