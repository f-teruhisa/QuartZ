# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'index#show'
  devise_for :members, :controllers => { :omniauth_callbacks => "members/omniauth_callbacks" }
  devise_scope :member do
    get '/members/sign_out' => 'devise/sessions#destroy'
  end

  # For Member Pages
  resources :members, :only => [:show, :edit, :update]

  # For Organization Admin Panel
  scope :organization_admin do
    resources :organizations, :only => [:create, :new, :show, :edit, :update]
  end

  resources :organizations, :only => [:index] do
    resources :member_organization_association
    resources :lunch, only: %i[index create show] do
      resources :groups, only: %i[show edit update]
    end
  end
end
