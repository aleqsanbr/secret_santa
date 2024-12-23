class GroupsController < ApplicationController
  before_action :set_group, only: [ :show, :edit, :update, :destroy, :settings ]
  before_action :require_login
  before_action :authorize_owner, only: [ :edit, :update, :destroy, :settings ]

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
    @group = Group.find_by(invitation_code: params[:invitation_code])

    if @group
      @group.group_members.create(user_id: current_user.id)
      redirect_to dashboard_path, notice: "You have successfully joined the group!"
    else
      flash[:alert] = "Invalid invitation code"
      render :join
    end
  end

  def settings
  end

  def show
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to group_path(@group), notice: "Group was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @group = Group.find(params[:id])
    if @group.destroy
      redirect_to dashboard_path, notice: "Group was successfully deleted."
    else
      redirect_to group_path(@group), alert: "Failed to delete group."
    end
  rescue => e
    redirect_to dashboard_path, alert: "Error occurred while deleting group. #{e.message}"
  end

  def start_distribution
    @group = Group.find(params[:id])

    if @group.distribute_santas
      redirect_to group_path(@group), notice: "Secret Santa distribution has been completed!"
    else
      if @group.distribution_started?
        redirect_to group_path(@group), alert: "Distribution has already been done!"
      elsif @group.group_members.count < 3
        redirect_to group_path(@group), alert: "Need at least 3 participants for Secret Santa!"
      else
        redirect_to group_path(@group), alert: "Something went wrong with the distribution."
      end
    end
  end

  private

  def set_group
    @group = Group.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to dashboard_path, alert: "Group not found."
  end

  def group_params
    params.require(:group).permit(:name, :description, :invitation_code, :is_active, :distribution_started)
  end

  def authorize_owner
    unless @group.owner == current_user
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to root_path
    end
  end

  def require_login
    unless current_user
      flash[:alert] = "Please log in to continue."
      redirect_to login_path
    end
  end
end
