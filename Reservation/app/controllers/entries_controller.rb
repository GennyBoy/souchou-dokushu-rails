class EntriesController < ApplicationController
  before_action :set_entry, only: :destroy

  def new
    @entry = Entry.new(room_id: params[:room_id])
  end

  def index
    @entries = Entry.all
  end

  def create
    @entry = Entry.new(entry_params)

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
    entry_user = User.find_by(email: @entry.user_email)
    if current_user.id != entry_user.id
      return redirect_to room_path(@entry.room), notice: 'You are not authorized to access this page.'
    end
    @entry.destroy

    head :no_content
  end

  def confirm
    @entry = Entry.new(entry_params)
    @entry.valid?
  end

  private

  def set_entry
    @entry = Entry.find(params[:id])
  end

  def entry_params
    params.require(:entry).permit(:user_name, :user_email, :reserved_date, :usage_time, :room_id, :people)
  end
end
