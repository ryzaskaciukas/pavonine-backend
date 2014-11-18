class ScriptsController < ApplicationController
  def core
    @app = App.find_by(name: params[:name])

    respond_to do |format|
      format.js { render 'core.js.erb' }
    end
  end
end
