class App
  include Mongoid::Document
  include Mongoid::Token
  field :name, type: String
  field :user, type: String
  token
  # embedded_in :user

  def url(request)
    "#{request.base_url}/app/#{name}"
  end

  def js(request)
    "#{url(request)}.js"
  end

  def script(request)
    "<script src='#{js(request)}'></script>"
  end

  def stylesheet(request)
    "#{request.base_url}/assets/example.css"
  end
end
