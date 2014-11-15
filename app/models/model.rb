class Model
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  include Mongoid::Token
  include Mongoid::Timestamps

  field :model, type: String
  field :app_token, type: String
  token

  before_save do
    attributes.each do |attribute, value|
      if /\A[-+]?\d+\z/ === value
        self[attribute] = value.to_i
      end
    end
  end
end
