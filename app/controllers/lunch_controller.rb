class LunchController < ApplicationController
  before_action :set_resources

  def index; end

  def create; end

  def new
    flash[:notice] = "Are you ready to plan new lunch??"
    redirect_to organization_path(@organization.id)
  end

  def show; end

  def edit; end

  private

  def set_resources
    @organization = Organization.find(params[:organization_id])
    @lunches = Lunch.where(organization_id: params[:organization_id])
  end
end
