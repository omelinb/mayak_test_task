class CreateFeedbacks < ActiveRecord::Migration[6.0]
  def change
    create_table :feedbacks do |t|
      t.string :feedback_id, index: true
      t.integer :imt_id
      t.integer :nm_id
      t.integer :wb_user_id
      t.decimal :rank, precision: 10, scale: 6, default: 0
      t.datetime :left_at

      t.timestamps
    end
  end
end
