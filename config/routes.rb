# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'index#show'
  devise_for :members
  resources :organizations do
    resources :lunches, only: %i[create new show edit]
end
