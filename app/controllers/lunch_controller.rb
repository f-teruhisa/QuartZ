class LunchController < ApplicationController
  def create; end

  def new
    flash[:notice] = "Are you ready to plan new lunch??"
    redirect_to organization_path(@organization.id)
  end

  def show; end

  def edit; end
end
