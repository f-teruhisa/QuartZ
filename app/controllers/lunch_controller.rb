class LunchController < ApplicationController
  before_action :set_resources

  def index; end

  def create
    binding.pry()
    @lunch.save
  end

  def new
    @lunch = Lunch.new(organization_id: @organization.id)
  end

  def show; end

  def edit; end

  private

  def set_resources
    @organization = Organization.find(params[:organization_id])
    @lunches = Lunch.where(organization_id: params[:organization_id])
  end
end
