class OrdersController < ApplicationController

  before_action :set_order, only: [:index, :create]

  def index
    return redirect_to root_path if !@item.order.nil? || user_signed_in? == false || current_user.id == @item.user_id

    @order_shipping = OrderShipping.new
  end

  def create
    @order_shipping = OrderShipping.new(order_shipping_params)
    if @order_shipping.valid?
      pay_item
      @order_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_shipping_params
    params.permit(:token, :item_id, :postal_code, :prefecture_id, :city, :addresses, :addresses, :building, :phone_number).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_shipping_params[:token],
      currency: 'jpy'
    )
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

end
