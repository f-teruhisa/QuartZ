class LunchController < ApplicationController
  before_action :set_resources

  def index; end

  def create
    members = @members.shuffle
    numbers_of_groups = @organization.numbers_of_groups
    numbers_of_group_members = @organization.numbers_of_group_members
    create_lunch(members, numbers_of_groups, numbers_of_group_members)
  end

  def show
    @lunch = Lunch.find(params[:id])
    @groups = Group.where(lunch_id: params[:id])
  end

  def edit; end

  private

  def create_lunch(members, numbers_of_groups, numbers_of_group_members)
    return redirect_to action: 'index', notice: 'The number of groups has not been set.' if numbers_of_groups.zero?
    return redirect_to action: 'index', notice: 'The number of group members has not been set.'  if numbers_of_group_members.zero?
    lunch = Lunch.create(organization_id: @organization.id)
    create_groups(lunch, numbers_of_groups, members, numbers_of_group_members)
    redirect_to action: :index
  end

  def create_groups(lunch, numbers_of_groups, members, numbers_of_group_members)
    numbers_of_groups.times do |num|
      group = lunch.create_group_with_rank!(num)
      group_members = members.pop(numbers_of_group_members)
      assign_members(group, group_members)
    end
  end

  def assign_members(group, group_members)
    group_members.each do |group_member|
      group.create_member_group_association!(group_member)
    end
  end

  def set_resources
    @organization = Organization.find(params[:organization_id])
    @lunches = Lunch.where(organization_id: params[:organization_id])
    @members = Member.includes(:organizations).where(organizations: { id: @organization.id })
  end
end
