class CreateDatasetClasses < ActiveRecord::Migration[5.2]
  def change
    create_table :dataset_classes do |t|
      t.string :name
      t.text :description
      t.references :dataset, foreign_key: true

      t.timestamps
    end
  end
end
