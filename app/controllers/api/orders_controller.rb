class Api::OrdersController < ApplicationController
  def create
    if !session
      return render json: { error: "user not logged in" }, status: :unauthorized
    end

    now = DateTime.current

    begin
      @order =
        Order.create(
          {
            user_id: session.user.id,
            order_date: now,
            status: "Not Shipped",
            payment_status: false,
            recipient_name: params[:order][:recipient_name],
            shipping_address_1: params[:order][:shipping_address_1],
            shipping_address_2: params[:order][:shipping_address_2],
            postal_code: params[:order][:postal_code],
            city: params[:order][:city],
            country: params[:order][:country],
            phone_number: params[:order][:phone_number]
          }
        )
      render "api/orders/create", status: :created
    rescue ArgumentError => e
      render json: { error: e.message }, status: :bad_request
    end
  end

  def index
    if session
      @orders = session.user.orders
      render "api/orders/index"
    else
      render json: { orders: [] }
    end
  end

  private

  def order_params
    params.require(:order).permit(
      :recipient_name,
      :shipping_address_1,
      :shipping_address_2,
      :postal_code,
      :city,
      :country,
      :phone_number
    )
  end

  def session
    token = cookies.signed[:ecommerce_session_token]
    session = Session.find_by(token: token)
  end
end
