class AddSubscriberIdToMessage < ActiveRecord::Migration
  def change
    add_reference :messages, :subscriber, index: true
  end
end
