class AcceptancesController < ApplicationController
  def new
    @acceptance = Acceptance.new
  end

  def create
    @acceptance = Acceptance.new(acceptance_params)
    if @acceptance.valid?
      puts "承諾されました！！"
      redirect_to books_path
    else
      render :new
    end
  end

  private
  def acceptance_params
    params.require(:acceptance).permit(:accepting)
  end
end
