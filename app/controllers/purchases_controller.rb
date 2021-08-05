class PurchasesController < ApplicationController
  def index
    @display = Display.find(params[:display_id])
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      @display = Display.find(params[:display_id])
      render :index
    end
  end

    private
    def purchase_params
      params.permit(:postal_code, :area_id, :city, :house_number, :house_name, :telephone_number).merge(user_id: current_user.id, display_id: params[:display_id])
    end
end
