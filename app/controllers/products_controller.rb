class ProductsController < ApplicationController
   def index
    #@products = Product.all
    #@products = @products.order(:category, :name)
 
     @categoryall = Product.all
    
   
   if params[:searchname] &&  params[:searchcategory] 
      @products = Product.search(params[:searchname], params[:searchcategory]).paginate(page: params[:page], per_page: 5)
      @products = @products.order(:category, :name)
     elsif params[:searchname]
      @products = Product.search(params[:searchname], "").paginate(page: params[:page], per_page: 5)
      @products = @products.order(:category, :name)
     elsif params[:searchcategory]
      @products = Product.search("", params[:searchcategory])..paginate(page: params[:page], per_page: 5)
       @products = @products.order(:category, :name)
     else
      @products = Product.all.paginate(page: params[:page], per_page: 5)
      @products = @products.order(:category, :name)
   end
   
     @order_item = current_order.order_items.new
   end
   
   def import
       Product.delete_all
       file_data = params[:file].read
       csv_rows  = CSV.parse(file_data)

       csv_rows.each do |row|
       Product.create! productid: row[0], category: row[1], name: row[2], price: row[3]
       end
       redirect_to products_path
  
   end
  
     
end
