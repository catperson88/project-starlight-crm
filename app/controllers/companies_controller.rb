class CompaniesController < ApplicationController

  def index
    @Companies = Company.all
  end

  def new
    @company = Company.new
    @account_id= params[:account_id]
    if @account_id.nil?
       render :new_1
    else 
      @account= Account.find(@account_id)
      render :new
    end
  end

  def create
    @account= Account.find(params[:account_id])
    @company = Company.new(account_params_0)
    @company.account = @account
      if @company.save
        flash[:notice]= "Company added successfully"
        redirect_to @account
      else
        flash.now[:error] = @company.errors.full_messages.to_sentence
        render :new
      end
  end

  private

  def account_params_0
    params.require(:company).permit(:name, :address, :city, :state, :zip, :description)
  end

end