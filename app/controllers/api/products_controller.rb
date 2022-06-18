class Api::ProductsController < ApplicationController
  def index
    @properties = Property.order(created_at: :desc).page(params[:page]).per(6)
    if !@properties
      return render json: { error: "not_found" }, status: :not_found
    end

    render "api/products/index", status: :ok
  end

  def show
    @property = Property.find_by(id: params[:id])
    return render json: { error: "not_found" }, status: :not_found if !@property

    render "api/products/show", status: :ok
  end

  def create
    token = cookies.signed[:ecommerce_session_token]
    session = Session.find_by(token: token)

    if session
      user = session.user
      @property = user.properties.new(property_params)

      if @property.save
        render "api/properties/show", status: :ok
      else
        render json: { products: [] }
      end
    else
      render json: { products: [] }
    end
  end

  def edit
    token = cookies.signed[:airbnb_session_token]
    session = Session.find_by(token: token)

    if session
      @property = Property.find_by(id: params[:id])

      if @property and @property.update(property_params)
        render "api/properties/show"
      else
        render json: { success: false }
      end
    else
      render json: { success: false }
    end
  end

  private

  def product_params
    params.require(:product).premit(
      :title,
      :description,
      :sku,
      :price,
      :quantity,
      :image
    )
  end
end
