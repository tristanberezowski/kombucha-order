class Admin::PaymentsController < Admin::ApplicationController

  def new
    @order = Order.find(params[:order_id])
    @payment = Payment.new
  end

  def create
    @order = Order.find(params[:order_id])
    @payment = Payment.new(payment_params)
    @payment.order = @order
    if @payment.save
      @order.pay!
      redirect_to admin_order_path(@order), notice: t("orders.payment.create.success")
    else
      render :new
    end
  end

  private

  def payment_params
    params.require(:payment).permit(
      :payee, :payment_method, :payment_date
    )
  end
end
