# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'index#show'
  devise_for :members
  resources :member_organization_associations do
    resources :lunches, only: %i[create new show edit] do
      resources :groups, only: %i[create new show edit]
    end
  end
end
