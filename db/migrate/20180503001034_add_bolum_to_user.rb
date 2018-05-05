class AddBolumToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :bolum, :string
  end
end
