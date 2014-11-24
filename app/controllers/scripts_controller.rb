class ScriptsController < ApplicationController
  def generate
    @app = App.find_by(name: params[:name])

    respond_to do |format|
      format.js { render 'generate.js.erb' }
    end
  end
end
