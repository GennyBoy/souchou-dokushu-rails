class EntriesController < ApplicationController
  before_action :set_entry, only: :destroy

  def new
    # app/views/entries/_form.html.erb で `Create Entry` を押すと confirm が呼ばれる。
    # もともとやっていたやり方だと create で user_id をセットしていたので、 confirm が呼ばれた時点では、 user が紐づけられておらずエラーになる。
    # new で user を紐づけてあげて、 view から hidden parameter で送るという、 room_id でも使っているやり方を適用して解決した
    @entry = Entry.new(room_id: params[:room_id], user_id: current_user.id)
  end

  def index
    @entries = Entry.all
  end

  def create
    @entry = Entry.new(entry_params)
    # 画面遷移的に new -> confirm -> create の順で呼ばれる
    # 最初は下記のようにこのタイミングで user を紐づけていた。
    # このやり方だとconfirmメソッドが呼ばれたタイミングで params に user_id がなく落ちてしまう
    # @entry = Entry.new(room_id: params[:room_id], user_id: loggedin_user.id, reserved_date: params[:reserved_date], usage_time: params[:usage_time], people: params[:people])

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
    if current_user.id != @entry.user.id
      return redirect_to room_path(@entry.room), notice: 'You are not authorized to access this page.'
    end
    @entry.destroy

    head :no_content
  end

  # app/views/entries/_form.html.erb で `Create Entry` を押すと  createの前にが呼ばれる。
  # app/views/entries/confirm.html.erb でもう一度 `Create Entry` を押すと、 create が呼ばれる
  def confirm
    @entry = Entry.new(entry_params)
    # createでuser紐付けを行なっていたときは、下記の処理で落ちていた。
    @entry.valid?
  end

  private

  def set_entry
    @entry = Entry.find(params[:id])
  end

  def entry_params
    # formから user_id を送るようにしたのでパラメータとして受け付けるようにする
    params.require(:entry).permit(:reserved_date, :usage_time, :room_id, :people, :user_id)
  end
end
