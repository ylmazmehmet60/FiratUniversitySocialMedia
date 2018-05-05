class CreateHobis < ActiveRecord::Migration[5.0]
  def change
    create_table :hobis do |t|
      t.string :hobiisim
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
