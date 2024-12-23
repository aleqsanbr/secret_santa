class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id

    if @group.save
      @group.group_members.create(user_id: current_user.id)

      redirect_to group_settings_path(@group), notice: "Group was successfully created."
    else
      render :new
    end
  end

  def join
  end

  def settings
    @group = Group.find(params[:id])
  end

  def show
    @group = Group.find(params[:id])
  end

  private

  def group_params
    params.require(:group).permit(:name, :description, :invitation_code, :is_active, :distribution_started)
  end
end
