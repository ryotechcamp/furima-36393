class PurchasesController < ApplicationController
  def index
    @purchase_shipping_address = PurchaseShippingAddress.new
  end

  def create
  end
end
