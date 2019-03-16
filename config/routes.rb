# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'index#show'
  devise_for :members
  resources :organizations
  resources :member_organization_association
  resources :lunch, only: %i[index create new show edit] do
    resources :groups, only: %i[create new show edit]
  end
end
