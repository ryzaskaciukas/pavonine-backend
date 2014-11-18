Rails.application.routes.draw do
  databound :models
  root 'landing#index'
  get 'app/:name' => 'scripts#core'
  get 'landing/template/:name' => 'landing#template', as: :download_template
end
