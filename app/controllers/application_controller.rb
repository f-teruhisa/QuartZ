# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Redirect setting for devise after sign in
  def after_sign_in_path_for(_resource)
    '/organizations'
  end
end
