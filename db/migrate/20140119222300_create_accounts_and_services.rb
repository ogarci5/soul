class CreateAccountsAndServices < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
			t.string :sso_token
			t.string :password_digest
			t.boolean :paid
      t.timestamps
    end
 
    create_table :services do |t|
      t.string :name
      t.timestamps
    end
 
    create_table :accounts_services do |t|
      t.belongs_to :account
      t.belongs_to :service
    end
  end
end
