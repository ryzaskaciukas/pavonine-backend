class Model
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  include Mongoid::Token

  field :model, type: String
  field :app_token, type: String
  token
end
