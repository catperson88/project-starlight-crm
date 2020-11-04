class AccountsController < ApplicationController

  def index
    @Accounts = Account.all
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
      if @account.save
        flash[:notice]= "Account added successfully"
        redirect_to @account
      else
        flash.now[:error] = @account.errors.full_messages.to_sentence
        render :new
      end
  end

  def show
    @account = Account.find(params[:id])
  end



  private

  def account_params
    params.require(:account).permit(:name, :address, :city, :state, :zip, :description)
  end
end