class EntitiesController < ApplicationController
  before_action :authenticate_user!

  def new
    @entity = Entity.new
    @user = current_user
    @groups = Group.where(user: current_user)
  end

  def create
    @entity = Entity.new(entity_params)
    @entity.author = current_user

    if @entity.save
      redirect_to user_group_path(current_user, params[:group_id]), notice: 'Transaction added succesfully'
    else
      render :new, notice: 'Ooops, something went wrong'
    end
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount, :group_ids)
  end
end