class DealsController < ApplicationController

  def index
    @Deals = Deal.all
  end
end