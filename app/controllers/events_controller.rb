require 'line/bot'

class EventsController < ApplicationController
  before_action :logged_in_user, only: [:new ,:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit]
  
  def client
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    }
  end
  
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
      notification
      redirect_to events_url
    else
      render :new
    end
  end
  
  def notification #LINEアカウント全員に、別途定義したメッセージを送る
    message={       
       type: 'text',
       text: "新しく稽古会が追加されました！確認してみましょう！\nhttps://aqueous-everglades-07337.herokuapp.com/events/"
     }
    client.broadcast(message)
  end
  
  def edit
    @event = Event.find(params[:id])
  end
  
  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      @event = @event.update(prefecture_search:params[:event][:prefecture])
      flash[:success] = "イベント情報を更新しました。"
      redirect_to event_url
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

    def correct_user
      @user = User.find(params[:user_id])
      redirect_to(root_url) unless @user == current_user
    end

    # システム管理権限所有かどうか判定します。
    def admin_user
      redirect_to root_url unless current_user.admin?
    end
end
