class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_purchase, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]
  
  def index
    @purchase_address = PurchaseAddress.new
  end

  def create    
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

    private
    def purchase_params
      params.require(:purchase_address).permit(:postal_code, :area_id, :city, :house_number, :house_name, :telephone_number).merge(user_id: current_user.id, display_id: params[:display_id], token: params[:token])
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @display.price,  
        card: purchase_params[:token],
        currency: 'jpy' 
      )      
    end

    def set_purchase
      @display = Display.find(params[:display_id])
    end

    def move_to_index
      redirect_to root_path unless @display.user_id != current_user.id && @display.purchase.blank?
    end
end
