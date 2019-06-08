class UserExemptionsController < ApplicationController
    def update
        user_id = current_user.id
        user_exemption = UserExemption.where(user_id: user_id).first_or_create(
            delivery_fee: params[:delivery_fee],
            order_minimum: params[:order_minimum]
          )
        user_exemption.update(
            delivery_fee: params[:delivery_fee],
            order_minimum: params[:order_minimum]
          )
    end
end
