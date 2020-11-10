class Api::DealsController < ApiController
  def show
    render json: { deals: Deal.all}
  end


end