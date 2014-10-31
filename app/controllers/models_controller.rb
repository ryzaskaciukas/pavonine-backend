class ModelsController < ApplicationController
  include Databound

  private

  def permitted_columns
    :all
  end

  def model
    Model
  end
end
