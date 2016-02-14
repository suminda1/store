class CartsController < ApplicationController
  def show
    @order_items = current_order.order_items
    
     if params[:complete]
        if @order_items.size > 0 
          current_order.update_attribute(:order_status_id, "2")
          current_order.update_attribute(:customername, params[:customername])
          current_order.update_attribute(:customeremail, params[:customeremail])
          current_order.update_attribute(:customershpadd, params[:customershipadd])
          current_order.save
          session[:order_id] = nil
          flash[:success] = "your cart ordered" 
          redirect_to products_path
        elsif
           flash[:success] = "There are no items in your shopping cart." 
          redirect_to cart_path
        end
     end
  end
  
  def edit
      @order_items = current_order.order_items
  end  

end
