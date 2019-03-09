class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :comments
      t.string :author
      t.belongs_to :user, foreign_key: true
      t.belongs_to :trip, foreign_key: true

      t.timestamps
    end
  end
end
