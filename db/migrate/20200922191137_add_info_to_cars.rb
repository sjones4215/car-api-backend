class AddInfoToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :info, :string
  end
end
