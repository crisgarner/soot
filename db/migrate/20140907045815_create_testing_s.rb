class CreateTestingS < ActiveRecord::Migration
  def change
    create_table :testing_s do |t|

      t.timestamps
    end
  end
end
