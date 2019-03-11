class CreateLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :labels do |t|
      t.float :x_pos
      t.float :y_pos
      t.references :user, foreign_key: true
      t.references :dataset_class, foreign_key: true
      t.references :image, foreign_key: true

      t.timestamps
    end
  end
end
