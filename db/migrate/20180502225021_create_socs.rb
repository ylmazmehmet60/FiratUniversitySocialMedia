class CreateSocs < ActiveRecord::Migration[5.0]
  def change
    create_table :socs do |t|
      t.string :socname
      t.text :socbody
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
