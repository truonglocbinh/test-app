class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :price, default: 0
      t.integer :quantity
      t.timestamps
    end

    # fulltext cho trường name và description
    # add_index :products, [:name, :description], name: "name_description", type: :fulltext
  end
end
