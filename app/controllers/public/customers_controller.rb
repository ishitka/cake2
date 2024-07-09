class Public::CustomersController < ApplicationController
  def show 
    @customer = Customer.find(params[:id])
  end
  
  def edit
    @customer = current_customer
  end
  
  def update
    if Customer.update(customer_params)
      redirect_to customer_path(current_customer)
    else
      render_to :edit
    end
  end
  private
  
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :email, :password, :password_confirmation, :is_active)
  end
end
