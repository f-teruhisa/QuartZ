class MembersController < ApplicationController
  before_action :load_resouces, only: %i[show edit update]
  def show; end

  def edit
    redirect_to action: :show unless same_member?
  end

  def update
    @member.update(update_params)
    redirect_to action: :show
  end

  private

  def same_member?
    # 違うユーザーのeditを防ぐためにユーザーの一致を返す
    @current_member == @member
  end

  def load_resouces
    @member = Member.find(params[:id])
    # current_memberをViewで複数回使用する際に、DBを複数スキャンすることを防ぐ
    current_member.nil? ? @current_member = Member.find_by(id: session[:member_id]) : @current_member
  end

  def update_params
    params.require(:member).permit(:name, :email, :text, :image_url).merge(password: @member.encrypted_password)
  end
end
