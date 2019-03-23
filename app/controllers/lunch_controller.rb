class LunchController < ApplicationController
  before_action :set_resources

  def index; end

  def create
    @lunch = Lunch.new(organization_id: @organization.id)
    @lunch.save
    redirect_to action: :index
  end

  def new; end

  def show; end

  def edit; end

  private

  def set_resources
    @organization = Organization.find(params[:organization_id])
    @lunches = Lunch.where(organization_id: params[:organization_id])
  end
end
