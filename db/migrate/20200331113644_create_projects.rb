class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.timestamps
      t.references :user, foreign_key: true
    end
  end
end
