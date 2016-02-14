class AddEmailToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :customeremail, :string
  end
end
