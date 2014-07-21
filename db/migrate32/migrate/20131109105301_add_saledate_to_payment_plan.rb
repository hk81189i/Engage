class AddSaledateToPaymentPlan < ActiveRecord::Migration
  def change
    add_column :payment_plans, :saledate, :date
  end
end
