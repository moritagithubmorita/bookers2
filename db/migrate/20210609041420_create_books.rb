class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.title :string
      t.body :text
      t.user_id :integer

      t.timestamps
    end
  end
end
