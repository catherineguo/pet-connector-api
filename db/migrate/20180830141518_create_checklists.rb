class CreateChecklists < ActiveRecord::Migration[5.1]
  def change
    create_table :checklists do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      t.string :pet_name
      t.text :instructions

      t.timestamps
    end
  end
end
