class AddResultUrlToCleaning < ActiveRecord::Migration[6.1]
  def change
    add_column :cleanings, :result_url, :string
  end
end
