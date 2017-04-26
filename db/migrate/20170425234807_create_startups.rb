class CreateStartups < ActiveRecord::Migration[5.0]
  def change
    create_table :startups do |t|

      t.timestamps
    end
  end
end
