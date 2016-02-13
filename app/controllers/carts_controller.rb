class CartsController < ApplicationController
  def show
    @order_items = current_order.order_items
    
     if params[:complete]
        current_order.update_attribute(:order_status_id, "2")
        session[:order_id] = nil
        redirect_to products_path
     end
  end
  
  def edit
      @order_items = current_order.order_items
  end  

  def create
     current_order.update_attribute(:order_status_id, "2")
  end
  
end
