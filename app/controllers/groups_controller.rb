class GroupsController < ApplicationController
  before_action :load_resouces, only: %i[show]
  def create; end

  def new; end

  def show;end

  def update
    group = Group.find(params[:id])
    group.update_attributes(group_params)
    redirect_to action: :show
  end

  def load_resouces
    @group = Group.find(params[:id])
    @lunch = Lunch.find(params[:lunch_id])
    @organization = Organization.find(@lunch.organization_id)
    @members = Member.group_members(@group.id)
  end

  private
   def group_params
      params.require(:group).permit(:comment, :url, :image_url)
  end
end
