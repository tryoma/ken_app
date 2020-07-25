class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)
    if @event.save
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
      params.require(:event).permit(:event_day, :start_time, :finish_time, :prefecture, :place, :estimate_people, :level, :organizer_name, :organizer_tel, :comment )
    end
end
