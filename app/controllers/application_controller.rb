# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # deviseでのログイン後の遷移先を指定
  def after_sign_in_path_for(_resource)
    '/organizations'
  end
end
