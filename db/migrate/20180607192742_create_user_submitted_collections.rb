class CreateUserSubmittedCollections < ActiveRecord::Migration
  def change
    create_table :user_submitted_collections do |t|
      t.string :name
      t.text   :description
      t.string :identifier

      t.timestamps null: false
    end
  end
end
