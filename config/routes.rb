Rails.application.routes.draw do
  root 'imei#show'
  post 'check', to: 'imei#check'
end
