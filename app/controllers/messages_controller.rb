class MessagesController < ApplicationController
  include Databound

  private def model
    Message
  end
end
