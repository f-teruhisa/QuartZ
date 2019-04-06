class MembersController < ApplicationController
  before_action :load_resouces, only: [:show]
  def show; end

  def load_resouces
    @member = Member.find(params[:id])
  end
end
