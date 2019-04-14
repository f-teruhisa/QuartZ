class MemberOrganizationAssociationController < ApplicationController
  before_action :load_resources, only: %i[index new create]
  def index; end

  def create
    @association = MemberOrganizationAssociation.create(create_association_params)
    redirect_to action: :new, flash: { success: 'Success!!' }
  end

  def new; end

  def search; end

  private

  def load_resources
    @organization = Organization.find(params[:organization_id])
    @members = Member.organization_members(@organization.id)
  end

  def create_association_params
    params.require(:member_organization_association).permit(:member_id, :group_id)
  end
end
