class AddShipingaddressToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :customershpadd, :string
  end
end
