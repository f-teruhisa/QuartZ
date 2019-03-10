# frozen_string_literal: true

Rails.application.routes.draw do
  get 'groups/create'
  get 'groups/new'
  get 'groups/show'
  get 'membergroup_association/create'
  get 'membergroup_association/new'
  get 'membergroup_association/show'
  root to: 'index#show'
  devise_for :members
  resources :organizations do
    resources :lunches, only: %i[create new show edit]
  end
end
