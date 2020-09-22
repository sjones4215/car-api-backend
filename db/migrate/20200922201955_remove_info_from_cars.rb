class RemoveInfoFromCars < ActiveRecord::Migration[6.0]
  def change
    remove_column :cars, :info
  end
end
