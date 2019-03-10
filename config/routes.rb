# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :members
  resources :organizations
  root to: 'index#show'
end
