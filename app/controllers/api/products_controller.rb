class Api::ProductsController < ApplicationController
  def index
    @products = Product.order(created_at: :desc).page(params[:page]).per(6)
    return render json: { error: "not_found" }, status: :not_found if !@product

    render "api/products/index", status: :ok
  end

  def show
    @product = Product.find_by(id: params[:id])
    return render json: { error: "not_found" }, status: :not_found if !@product

    render "api/products/show", status: :ok
  end

  def create
    if session
      user = session.user
      @product = user.products.new(product_params)

      if @product.save
        render "api/products/show", status: :ok
      else
        render json: { products: [] }
      end
    else
      render json: { products: [] }
    end
  end

  def edit
    if session
      @product = Product.find_by(id: params[:id])

      if @product and @product.update(product_params)
        render "api/products/show"
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

  def session
    token = cookies.signed[:ecommerce_session_token]
    session = Session.find_by(token: token)
  end
end
