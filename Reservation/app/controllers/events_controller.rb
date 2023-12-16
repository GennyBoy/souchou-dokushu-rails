class EventsController < ApplicationController
  def create
    @event = Event.new(event_params)
    if @event.save
      NoticeMailer.greeting(@event).deliver_now
      redirect_to @event, notice: "登録されました"
    else
      render :new
    end
  end
end
