class CreateSubscriptions < ActiveRecord::Migration
  def change
    drop_table :subscriptions
    
    create_table :subscriptions do |t|
      t.integer :newsletter_id
      t.integer :user_id
      t.boolean :active

      t.timestamps
    end
  end
  
  def down
    drop_table :subscriptions
  end
end
