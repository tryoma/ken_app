class EventsController < ApplicationController
  before_action :logged_in_user, only: [:new ,:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy 
  
  def show
    @event = Event.find(params[:id])
  end

  def index
    @search_events = Event.all.page(params[:page]).search(params[:search])
  end

  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)
    if @event.save
      @event = @event.update(prefecture_search:params[:event][:prefecture])
      flash[:success] = 'イベント新規作成に成功しました。'
      redirect_to events_url
    else
      render :new
    end
  end
  
  def edit
    @event = Event.find(params[:id])
  end
  
  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      @event = @event.update(prefecture_search:params[:event][:prefecture])
      flash[:success] = "イベント情報を更新しました。"
      redirect_to event_url(@event)
    else
      render :edit
    end 
  end
  
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:success] = "#{@event.event_day}のデータを削除しました。"
    redirect_to events_url
  end
  
  private

    def event_params
      params.require(:event).permit(:event_day, :start_time, :finish_time, :prefecture, :place, :estimate_people, :level, :organizer_user_id, :organizer_name, :organizer_tel, :comment )
    end
    
   # ログイン済みのユーザーか確認します。
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "ログインしてください。"
        redirect_to login_url
      end
    end

    # アクセスしたユーザーが現在ログインしているユーザーか確認します。
    def correct_user
      redirect_to(root_url) unless current_user?(current_user)
    end

    # システム管理権限所有かどうか判定します。
    def admin_user
      redirect_to root_url unless current_user.admin?
    end
end
