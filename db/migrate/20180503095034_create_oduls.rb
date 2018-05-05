class CreateOduls < ActiveRecord::Migration[5.0]
  def change
    create_table :oduls do |t|
      t.string :odulisim
      t.string :odulveren
      t.string :odulyil
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
