Rails.application.routes.draw do
  databound :models
  root 'landing#index'
  get 'app/:name' => 'scripts#generate'
  get 'landing/template/:name' => 'landing#template', as: :download_template
end
