class AddressesController < ApplicationController
  before_action :find_address, only: [:show, :edit, :update]

  def new
    @address = Address.new
    @billing_address = current_user.billing_address
    @shipping_address = current_user.shipping_address
  end

  def create
    address_relation = address_params[:type].underscore
    @address = current_user.public_send(address_relation) || current_user.public_send("build_#{address_relation}")
    @address.assign_attributes(address_params)
    if @address.save
      redirect_to settings_addresses_path
    else
      render 'new'
    end
  end

  private

  def find_address
    @address = Address.find(params[:user_id])
  end

  def address_params
    params.require(:address).permit(:type, :first_name, :last_name, :address,
                                    :city, :zip, :country, :phone)
  end
end
