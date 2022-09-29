class CreateShorteners < ActiveRecord::Migration[6.1]
  def change
    create_table :shorteners do |t|
      t.string :url
      t.string :short_code
      t.integer :alexa_rank
      t.integer :counter

      t.timestamps
    end
  end
end
