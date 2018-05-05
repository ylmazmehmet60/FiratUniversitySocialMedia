class CreateYabancidils < ActiveRecord::Migration[5.0]
  def change
    create_table :yabancidils do |t|
      t.string :yabancidilisim
      t.string :yabancidilsinavisim
      t.string :yabancidilyil
      t.string :yabancidilpuan
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
