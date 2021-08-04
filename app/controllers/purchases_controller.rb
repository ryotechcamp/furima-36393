class PurchasesController < ApplicationController
  def index
    @purchase_shipping_address = PurchaseShipping_address.new
  end

  def create
  end
end
