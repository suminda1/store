class AddProductid1ToProducts < ActiveRecord::Migration
  def change
    add_column :products, :productid, :string
  end
end
