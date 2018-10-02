class RegistrationsController < Devise::RegistrationsController

  def create
    customer = Customer.create({
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]})

    if customer.valid?
      sign_in customer
      render :json => {:success=>true, current_customer: current_customer }
    else
      render :json => {:success=>false, message: "Oooops"}
    end
    p customer.valid?

  end

  private

  def sign_up_params
    params.require(:customer).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
