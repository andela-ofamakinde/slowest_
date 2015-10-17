class AddCounterCacheToAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :articles_count, :integer, default: 0
  end
end
