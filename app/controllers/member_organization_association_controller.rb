class MemberOrganizationAssociationController < ApplicationController
  before_action :load_resources, only: %i[index new create]
  def index; end

  def create
    @association = MemberOrganizationAssociation.create(create_association_params)
    redirect_to action: 'new', notice: 'Complete!!'
  end

  def new
    @searched_members = Member.search(params[:search])
  end

  private

  def load_resources
    @organization = Organization.find(params[:organization_id])
    @members = Member.organization_members(@organization.id)
  end

  def create_association_params
    params.permit(:member_id, :organization_id)
  end
end
