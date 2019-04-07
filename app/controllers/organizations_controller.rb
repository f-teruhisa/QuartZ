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

  def edit
    redirect_to action: 'show' unless organizer?
  end

  def create
    @organization = Organization.create(organization_params)
    redirect_to action: 'show', id: @organization.id, flash: { success: 'Success!!' }
  end

  def update
    organization = Organization.find(params[:id])
    organization.update(organization_params)
    redirect_to action: 'show'
  end

  private

  def organizer?
    # OrganizerでないユーザーがOrganizationの情報を編集するのを防ぐ
    member_organization_association = MemberOrganizationAssociation.find_by(
      member_id: current_member.id,
      organization_id: @organization.id
    )
    member_organization_association ? member_organization_association.organizer : false
  end

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
