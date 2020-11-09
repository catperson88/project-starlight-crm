class ContactsController < ApplicationController

  def index
    @Contacts = Contact.all
  end

  def show 
    @contact= Contact.find(params[:id])
  end

  def new
    @contact = Contact.new
    @company_id = params[:company_id]
    if @company_id.nil?
       render :new_1
    else 
      @company= Company.find(@company_id)
      render :new
    end
  end

  def create
    @company_nil_catch = params[:contact][:company]
    if @company_nil_catch.nil? 
      @company= Company.find(params[:company_id])
      @contact = Contact.new(contact_params)
      @contact.company = @company
    else  
      @company = Company.find_by! name: @company_nil_catch
      dry_up_create(contact_params)
    end

    if @contact.save
      flash[:notice]= "Contact added successfully"
      redirect_to @contact
    elsif @contact.save == false && @contact_nil_catch.nil?
      flash.now[:error] = @contact.errors.full_messages.to_sentence
      render :new_1
    elsif @contact.save == false && @contact_nil_catch.nil? == false
      flash.now[:error] = @contact.errors.full_messages.to_sentence
      render :new
    end
  end



end

  private

  def dry_up_create(params)
      @contact = Contact.new(params)
      @contact.company = @company
      return @contact
  end

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :title, :phone, :email_address, :notes)
  end
