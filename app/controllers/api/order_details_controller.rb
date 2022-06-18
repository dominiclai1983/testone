class Api::OrderDetailsController < ApplicationController
  private 

  def order_detail_params
    params.require(:order_detail).permit(:order_id, :product)
end
