class MembersController < ApplicationController
  
  def create
    @event = Event.find(params[:id])
    @user = User.find(params[:user])
    @event.members.new(member_name:@user.name,
                         user_id:@user.id,)
    if @event.save
      flash[:success] = 'イベントに参加しました。'
      redirect_to event_url(@event)
    else
      render :show
    end
  end
  
  def destroy
    @event = Event.find(params[:id])
    @user = User.find(params[:user])
    @member = @event.members.find_by(user_id:@user.id)
    if @member.present?
      @member.destroy
      flash[:success] = "参加をキャンセルしました。"
      redirect_to event_url
    else
      redirect_to event_url
    end
  end

end
