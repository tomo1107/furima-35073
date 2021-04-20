class PurchasesController < ApplicationController
  before_action :set_item
  before_action :authenticate_user!
  before_action :contributor_confirmation

  def index
    @purchase_delivery_information = PurchaseDeliveryInformation.new
  end

  def create
    @purchase_delivery_information = PurchaseDeliveryInformation.new(purchase_params)
    if @purchase_delivery_information.valid?
      pay_item
      @purchase_delivery_information.save
      redirect_to root_path
    else
      render :index
    end
  end

  def purchase_params
    params.require(:purchase_delivery_information).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def contributor_confirmation
    redirect_to root_path if current_user == @item.user || !@item.purchase.nil?
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
