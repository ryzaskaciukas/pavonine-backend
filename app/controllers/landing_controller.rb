class LandingController < ApplicationController
  def index
    @app = App.create(name: Faker::Company.name.parameterize, user: :not_saved)
  end

  def template
    @app = App.find_by(name: params[:name])

    code = render_to_string('landing/template', layout: false)
    respond_to do |format|
      format.html { render plain: code }
    end
  end
end
