class EntriesController < ApplicationController
  before_action :set_entry, only: :destroy

  def new
    @entry = Entry.new
    p '-' * 100
    p params[:room_id]
    p '-' * 100
  end

  def index
    @entries = Entry.all
  end

  def create
    @entry = Entry.new(entry_params)

    if @entry.save
      redirect_to entry_url(@entry), notice: 'Entry was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @entry.destroy

    redirect_to entries_url, notice: 'Entry was successfully destroyed.'
  end

  def confirm; end

  private

  def set_entry
    @entry = Entry.find(params[:id])
  end

  def entry_params
    params.require(:entry).permit(:user_name, :user_email, :reserved_date, :usage_time, :room_id, :people)
  end
end
