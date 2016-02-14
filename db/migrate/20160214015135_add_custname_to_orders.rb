class AddCustnameToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :customername, :string
    end
end
