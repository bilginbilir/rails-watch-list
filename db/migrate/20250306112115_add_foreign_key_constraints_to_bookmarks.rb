class AddForeignKeyConstraintsToBookmarks < ActiveRecord::Migration[7.1]
  def change
    # Removing existing foreign keys:
    remove_foreign_key :bookmarks, :movies if foreign_key_exists?(:bookmarks, :movies)
    remove_foreign_key :bookmarks, :lists if foreign_key_exists?(:bookmarks, :lists)

    # Adding foreign keys with appropriate delete rules:
    add_foreign_key :bookmarks, :movies, on_delete: :restrict
    add_foreign_key :bookmarks, :lists, on_delete: :cascade
  end
end
