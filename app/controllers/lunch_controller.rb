class LunchController < ApplicationController
  before_action :set_resources

  def index; end

  def create
    members = @members.shuffle
    numbers_of_groups = @organization.numbers_of_groups
    create_lunch(members, numbers_of_groups)
  end

  def show
    @lunch = Lunch.find(params[:id])
    @groups = Group.where(lunch_id: params[:id])
  end

  def edit; end

  private

  def create_lunch(members, numbers_of_groups)
    return redirect_to action: 'index' if numbers_of_groups.zero?
    lunch = Lunch.create(organization_id: @organization.id)
    create_groups(lunch, numbers_of_groups, members)
    redirect_to action: :index
  end

  def create_groups(lunch, numbers_of_groups, members)
    groups = []
    numbers_of_groups.times do |num|
      group = lunch.create_group_with_rank!(num)
      groups.push(group)
    end
    split_members(groups, numbers_of_groups, members)
  end

  def split_members(groups, numbers_of_groups, members)
    '''
    1人のみなどの端数のグループが発生しないよう、
    Member毎にをグループ分けの処理に渡す。
    '''
    members.each_with_index do |member, i|
      rank = i % numbers_of_groups
      assign_groups(groups, member, rank)
    end
  end

  def assign_groups(groups, member, rank)
    # MemberにGroupを割り当てる
    group = groups[rank]
    group.create_member_group_association!(member)
  end

  def set_resources
    @organization = Organization.find(params[:organization_id])
    @lunches = Lunch.where(organization_id: params[:organization_id])
    @members = Member.includes(:organizations).where(organizations: { id: @organization.id })
  end
end
