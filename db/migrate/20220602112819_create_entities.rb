class CreateEntities < ActiveRecord::Migration[7.0]
  def change
    create_table :entities do |t|
      t.string :name
      t.decimal :amount
      t.references :user, null: false, foreign_key: { to_table: 'users' }, index: true
      t.references :group, foreign_key: { to_table: 'groups' }, index: true

      t.timestamps
    end
  end
end
