class LandingController < ApplicationController
  INITIAL_NOTES = [
    'What can you do in 10 lines of code?',
    'Code as if you had the backend relations set up for you',
    'Use all Handlebars, Lodash and Moment.js helpers',
  ].freeze

  def index
    @app = App.create(name: generate_name, user: :not_saved)

    INITIAL_NOTES.each do |note|
      Model.create(app_token: @app.token, model: 'note', content: note)
    end
  end

  def template
    @app = App.find_by(name: params[:name])

    code = render_to_string('landing/template', layout: false)
    respond_to do |format|
      format.html { render plain: code }
    end
  end

  private

  def generate_name
    name = Faker::Company.name.parameterize

    name = generate_name if name.size > 17
    name = generate_name if App.where(name: name).last

    name
  end
end
