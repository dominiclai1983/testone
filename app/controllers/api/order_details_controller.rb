class Api::OrderDetailsController < ApplicationController
  def create
    if session
      @order_detail = Order_detail.new(order_detail_params)

      if @order_detail.save
        render "api/order_details/show", status: :ok
      else
        render json: { order_details: [] }
      end
    else
      render json: { order_details: [] }
    end
  end

  def get_order_details_by_order_id
    if session
      @order_details = Order_detail.where(order_id: params[:order])
      render "api/order_details/index", status: :ok
    else
      render json: { order_details: [] }
    end
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(
      :order_id,
      :product_id,
      :price,
      :quantity
    )
  end

  def session
    token = cookies.signed[:ecommerce_session_token]
    session = Session.find_by(token: token)
  end
end
