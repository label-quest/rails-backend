class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :file_path
      t.references :dataset, foreign_key: true

      t.timestamps
    end
  end
end
