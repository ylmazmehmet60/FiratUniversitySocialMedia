class CreateProjelers < ActiveRecord::Migration[5.0]
  def change
    create_table :projelers do |t|
      t.string :projelerisim
      t.string :projelerkurum
      t.string :projelergorev
      t.string :projelerbas
      t.string :projelerbit
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
