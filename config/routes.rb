# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  root 'home#about_me'

  scope '(:locale)', locale: /en|fr/ do
    get 'about_me', to: 'home#about_me'
    get 'download_resume', to: 'home#download_resume'
    get 'resume', to: 'home#resume'
    get 'portfolio', to: 'home#portfolio'
  end
end
