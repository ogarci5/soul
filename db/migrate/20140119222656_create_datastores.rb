class CreateDatastores < ActiveRecord::Migration
  def change
    create_table :datastores do |t|
      t.string :name
      t.references :service, index: true

      t.timestamps
    end
  end
end
