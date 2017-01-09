Rails.application.routes.draw do
  get 'apis/quickbooks/:action', :controller => 'quickbooks'
  post 'apis/quickbooks/:action', :controller => 'quickbooks'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
