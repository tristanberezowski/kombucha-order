class CreateProductContainers < ActiveRecord::Migration[5.2]
  def change
    create_table :product_containers do |t|
      t.belongs_to :product, foreign_key: true
      t.belongs_to :container, foreign_key: true

      t.timestamps
    end
  end
end
