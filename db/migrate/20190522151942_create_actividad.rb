class CreateActividad < ActiveRecord::Migration[5.2]
  def change
    create_table :actividades do |t|
      t.text :nombre, limit: 254, null: false, collation: 'es_co_utf_8'
      t.date :fecha
      t.decimal :valor
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end
