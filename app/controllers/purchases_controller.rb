class PurchasesController < ApplicationController
  def index
    @display = Display.find(params[:display_id])
    @purchase_shipping_address = PurchaseShippingAddress.new
  end

  def create
  end
end
