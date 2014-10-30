class AddCurrentUserIdToMessage < ActiveRecord::Migration
  def change
    add_reference :messages, :current_user, index: true
  end
end
