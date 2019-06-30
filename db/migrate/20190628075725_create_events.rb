class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.text :location
      t.string :amount

      t.timestamps
    end
  end
end
