class LunchController < ApplicationController
  before_action :set_resources

  def index; end

  def create
    members = @members.shuffle
    numbers = @organization.numbers_of_groups
    create_lunch(members, numbers)
  end

  def show
    @lunch = Lunch.find(params[:id])
    @groups = Group.where(lunch_id: params[:id])
  end

  def edit; end

  private

  def create_lunch(members, numbers)
    # TODO: 作るグループの数を都度設定できるようにする
    return redirect_to action: 'index', notice: 'The number of groups has not been set.' if numbers.zero?
    lunch = Lunch.create(organization_id: @organization.id)
    create_groups(lunch, numbers, members)
    redirect_to action: :index
  end

  def create_groups(lunch, numbers, members)
    numbers.times do |num|
      group = lunch.create_group_with_rank!(num)
      group_members = members.pop(5)
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
