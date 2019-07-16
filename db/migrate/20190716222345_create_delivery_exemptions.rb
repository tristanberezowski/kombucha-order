class CreateDeliveryExemptions < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_exemptions do |t|
      t.monetize :fee

      t.timestamps
    end
  end
end
