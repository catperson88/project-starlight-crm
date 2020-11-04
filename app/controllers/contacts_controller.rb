class ContactsController < ApplicationController

  def index
    @Contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end
end