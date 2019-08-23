class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :nickname
      t.text :review
      t.timestamps
    end
  end
end
