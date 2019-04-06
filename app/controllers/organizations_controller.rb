class OrganizationsController < ApplicationController
  before_action :set_organization, only: %i[show edit update]
  before_action :authenticate_member!, only: [:index]
  before_action :load_associations, only: [:index]

  def index
    @organizations = Organization.where(id: @member_organization_associations.id)
  end

  def show; end

  def new
    @organization = Organization.new
  end

  def edit; end

  def create
    @organization = Organization.new(organization_params)
  end

  def update; end

  private

  def load_associations
    @member = current_member
    @member_organization_associations = MemberOrganizationAssociation.find_by(member_id: @member.id)
  end

  def set_organization
    @organization = Organization.find(params[:id])
  end

  def organization_params
    params.require(:organization).permit(:name, :url, :image_url, :text)
  end
end
