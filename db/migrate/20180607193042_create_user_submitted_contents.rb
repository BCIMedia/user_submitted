class CreateUserSubmittedContents < ActiveRecord::Migration
  def change
    create_table :user_submitted_contents do |t|
      t.belongs_to :collection
      t.text       :caption
      t.string     :credit
      t.attachment :data
      t.string     :email
      t.text       :note
      t.integer    :status, limit: 1, default: 0

      t.timestamps null: false
    end
  end
end
