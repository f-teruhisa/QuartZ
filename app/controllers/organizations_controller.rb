class OrganizationsController < ApplicationController
  before_action :set_organization, only: %i[show edit update destroy]
  before_action :authenticate_member!, :only => [:index]
  before_action :load_associations, :only => [:index]

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

    respond_to do |format|
      if @organization.save
        format.html { redirect_to @organization, notice: 'Organization was successfully created.' }
        format.json { render :show, status: :created, location: @organization }
      else
        format.html { render :new }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @organization.update(organization_params)
        format.html { redirect_to @organization, notice: 'Organization was successfully updated.' }
        format.json { render :show, status: :ok, location: @organization }
      else
        format.html { render :edit }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @organization.destroy
    respond_to do |format|
      format.html { redirect_to organizations_url, notice: 'Organization was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

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

  def set_resouces
    {:page => params[:page]}
  end
end
