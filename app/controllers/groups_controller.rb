class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = current_user.groups.all.order(created_at: :desc)
  end

  def show
    @group = current_user.groups.find(params[:id])
    @entities = @group.entities.all.where(group_id: @group.id)
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.create(group_params)
    if @group.save
      flash[:notice] = 'Group created'
      redirect_to groups_path
    else
      flash[:alert] = 'Group not created'
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
