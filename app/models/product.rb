class Product < ActiveRecord::Base
 has_many :order_items
 
def self.search(pname, cname)
   #paginate :per_page => 2, :page => page :
   where("name LIKE ? AND category LIKE ? ", "%#{pname}%", "%#{cname}%")
end

 
end
