class GroupsController < ApplicationController
  before_action :load_resouces, only: %i[show]
  def create; end

  def new; end

  def show;end

  def load_resouces
    @group = Group.find(params[:id])
    @lunch = Lunch.find(params[:lunch_id])
    @organization = Organization.find(@lunch.organization_id)
    @members = Member.group_members(@group.id)
  end
end
