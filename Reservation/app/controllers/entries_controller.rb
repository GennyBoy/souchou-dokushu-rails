class EntriesController < ApplicationController
  before_action :set_entry, only: :destroy

  def new
    @entry = Entry.new(room_id: params[:room_id])
    p '-' * 100
    p params[:room_id]
    p '-' * 100
  end

  def index
    @entries = Entry.all
  end

  def create
    @entry = Entry.new(entry_params)
    p '-' * 100
    p params
    p '-' * 100

    if params[:back]
      render :new
      return
    end
    if @entry.save
      redirect_to room_path(@entry.room), notice: 'Entry was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @entry.destroy

    redirect_to room_path(@entry.room), notice: 'Entry was successfully destroyed.'
  end

  def confirm
    @entry = Entry.new(entry_params)
    @entry.valid?
    p '-' * 100
    p params
    p '-' * 100
  end

  private

  def set_entry
    @entry = Entry.find(params[:id])
  end

  def entry_params
    # params.require(:entry).permit(:user_name, :user_email, :reserved_date, :usage_time, :room_id, :people)
    params.tap do |o|
      p '=' * 100
      pp o
    end.require(:entry).permit(:user_name, :user_email, :reserved_date, :usage_time, :room_id, :people)
  end
end
