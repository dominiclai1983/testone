class Api::OrdersController < ApplicationController
  def create
    token = cookies.signed[:ecommerce_session_token]
    session = Session.find_by(token: token)
    if !session
      return render json: { error: "user not logged in" }, status: :unauthorized
    end

    now = DataTime.current

    begin
      @order = Order.create({user_id: session.user.id, order_date: now, order_params})
      render 'api/bookings/create', status: :created
    rescue ArgumentError => e
      render json: { error: e.message }, status: :bad_request
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
end
