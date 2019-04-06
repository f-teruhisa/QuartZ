# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'index#show'
  devise_for :members
  resources :members, :only => [:show, :edit, :update] # ユーザーの詳細画面のためのrouting
  resources :member_organization_association
  resources :organizations, :only => [:create, :new]
  resources :organizations, :only => [:index, :show, :edit, :update] do
    resources :lunch, only: %i[index create show] do
      resources :groups, only: %i[show edit update]
    end
  end
end
