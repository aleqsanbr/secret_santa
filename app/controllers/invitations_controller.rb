class InvitationsController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
    # Логика создания новой ссылки приглашения
  end
end
