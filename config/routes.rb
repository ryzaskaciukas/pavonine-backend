Rails.application.routes.draw do
  databound :models
  root 'landing#index'
end
