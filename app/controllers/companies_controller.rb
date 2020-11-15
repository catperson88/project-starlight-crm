class CompaniesController < ApplicationController

  def index
    @Companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
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
    @account_nil_catch = params[:company][:account]
    if @account_nil_catch.nil? 
      @account= Account.find(params[:account_id])
      dry_up_create(company_params)
    else
      @account = Account.find_by! name: @account_nil_catch
      dry_up_create(company_params)
    end

    if @company.save 
      flash[:notice]= "Company added successfully"
      redirect_to @company
    elsif @company.save == false && @account_nil_catch.nil?
      flash.now[:error] = @company.errors.full_messages.to_sentence
      render :new_1
    elsif @company.save == false && @account_nil_catch.nil? == false
      flash.now[:error] = @company.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def dry_up_create(params)
      @company = Company.new(params)
      @company.account = @account
  end

  def company_params
    params.require(:company).permit(:name, :address, :city, :state, :zip, :description)
  end
end