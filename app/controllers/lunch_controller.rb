class LunchController < ApplicationController
  before_action :set_resources

  def index; end

  def create
    lunch = Lunch.create(organization_id: @organization.id)
    members = @members.shuffle
    create_groups(lunch, members)
    redirect_to action: :index
  end

  def show; end

  def edit; end

  private

  def create_groups(lunch, members)
    # ZEALSの3月時点でのグループ分けの数でグループを作る
    # TODO: Organizationごとに作るグループの数を設定できるようにする
    # TODO: 作るグループの数を都度設定できるようにする
    7.times do |i|
      group = lunch.create_group_with_rank!(i)
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
    @members = Member.includes(:organizations).where(organizations: {id: @organization.id})
  end
end
