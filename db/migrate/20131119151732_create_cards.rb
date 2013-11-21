class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :term
      t.string :meaning
      t.boolean :done
      t.integer :group_id

      t.timestamps
    end
  end
end
