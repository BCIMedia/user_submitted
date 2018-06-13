class CreateUserSubmittedCollections < ActiveRecord::Migration
  def change
    create_table :user_submitted_collections do |t|
      t.string :name
      t.text   :description

      t.timestamps null: false
    end
  end
end
