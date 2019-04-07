# frozen_string_literal: true

Rails.application.routes.draw do
  get 'member_organization_associations/index'
  get 'member_organization_associations/create'
  get 'member_organization_associations/new'
  get 'users/index'
  get 'users/create'
  get 'users/new'
  root to: 'index#show'
  devise_for :members
  resources :members, :only => [:show, :edit, :update] # ユーザーの詳細画面のためのrouting
  resources :organizations, :only => [:create, :new]
  resources :organizations, :only => [:index, :show, :edit, :update] do
    resources :member_organization_association
    resources :lunch, only: %i[index create show] do
      resources :groups, only: %i[show edit update]
    end
  end
end
