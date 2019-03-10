# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'index#show'
  devise_for :members
  resources :organizations
end
