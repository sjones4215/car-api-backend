class AddDescriptionToCars < ActiveRecord::Migration[6.0]
  def change
    change_column :cars, :description, :string
  end
end
