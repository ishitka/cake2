class Public::AddressesController < ApplicationController
  
  def index
    customer_id = current_customer.id
    @addresses = Address.where(customer_id: customer_id)
  end
  
  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to addresses_path
    else
      render :new
    end
  end
  
  def edit
    @address = Address.find(params[:id])
  end
  
  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to addresses_path(current_customer.id)
  end
  
  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path(current_customer.id)
  end
  
  private
  
  def address_params
    params.require(:address).permit(:postal_code, :address, :name, :customer_id)
  end
end
