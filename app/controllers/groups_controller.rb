class GroupsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @groups = current_user.groups.all.order(created_at: 'DESC')
    @total = 0
    @groups.each do |group|
      @total += group.entities.sum(:amount)
    end
  end

  def show
    @group = Group.find(params[:id])
    @entities = @group.entities.order(created_at: :desc)
    @total = @group.entities.sum(:amount)
  end

  def new
    @group = current_user.groups.new
  end

  def create
    @group = Group.new group_params
    @group.user = current_user

    if @group.save
      redirect_to user_groups_path(current_user), notice: 'Category added successfully'
    else
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
