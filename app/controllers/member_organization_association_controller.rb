class MemberOrganizationAssociationController < ApplicationController
  before_action :load_resources, only: [:index]
  def index;end

  def create;end

  def new;end

  def load_resources
    @organization = Organization.find(params[:organization_id])
    @members = Member.organization_members(@organization.id)
  end
end
