class CreateProfils < ActiveRecord::Migration[6.1]
  def change
    create_table :profils do |t|
      t.string :name
      t.integer :no_hp
      t.string :email
      t.date :tgl_lhr
      t.string :jk
      t.string :kota
      t.integer :no_ktp
      t.string :alamat

      t.timestamps
    end
  end
end
