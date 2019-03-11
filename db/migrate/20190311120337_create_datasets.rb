class CreateDatasets < ActiveRecord::Migration[5.2]
  def change
    create_table :datasets do |t|
      t.string :name
      t.text :description
      t.float :goal
      t.string :folder_path
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
