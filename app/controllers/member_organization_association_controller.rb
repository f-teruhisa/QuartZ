class MemberOrganizationAssociationController < ApplicationController
  before_action :authenticate_member!, only: [:index]
  before_action :load_associations, only: [:index]

  def index
    @organizations = Organization.where(id: @member_organization_associations.id)
  end

  def create; end

  def new; end

  def show; end

  private

  def load_associations
    @member = current_member
    @member_organization_associations = MemberOrganizationAssociation.find_by(member_id: @member.id)
  end
end
