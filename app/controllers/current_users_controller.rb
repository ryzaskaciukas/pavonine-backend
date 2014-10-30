class CurrentUsersController < ApplicationController
  include Databound

  private def model
    CurrentUser
  end
end
