class DealsController < ApplicationController

  def index
    @Deals = Deal.all
  end

  def show
    @deal = Deal.find(params[:id])
  end

  def new
    @deal = Deal.new
    @company_id = params[:company_id]
    if @company_id.nil?
       render :new_1
    else 
      @company= Company.find(@company_id)
      render :new
    end
  end


  def create
    @company_nil_catch = params[:deal][:company]
    if @company_nil_catch.nil? 
      @company= Company.find(params[:company_id])
      dry_up_create(deal_params)
    else  
      @company = Company.find_by! name: @company_nil_catch
      dry_up_create(deal_params)
    end

    if @deal.save
      flash[:notice]= "Deal added successfully"
      redirect_to @deal
    elsif @deal.save == false && @contact_nil_catch.nil?
      flash.now[:error] = @deal.errors.full_messages.to_sentence
      render :new_1
    elsif @deal.save == false && @contact_nil_catch.nil? == false
      flash.now[:error] = @deal.errors.full_messages.to_sentence
      render :new
    end
  end



end

  private

  def dry_up_create(params)
      @deal = Deal.new(params)
      @deal.company = @company
  end

  def deal_params
    params.require(:deal).permit(:deal_name, :value, :discount_percentage, :stage, :discount_percentage, :quantity,  :description,)
  end


