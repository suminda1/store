class ProductsController < ApplicationController
   def index
     #for to get all category in system product list 
     @categoryall = Product.all
    
   #if both search parameter present then it will search by both
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
   #testfff 
      @order_item = current_order.order_items.new
   end
   
   def import
         #NOTE:this should be done by same traction block.beacuse if file file download process fail will lost previous product list
         Product.transaction do
            Product.delete_all
            CSV.new(open("https://dl.dropboxusercontent.com/u/6582068/products.csv"), :headers => :first_row).each do |row|
            Product.create! productid: row[0], category: row[1], name: row[2], price: row[3]
         end
      end
       flash[:success] = "Product List Upload Process completed"      
       redirect_to products_path

  
   end
  
     
end
