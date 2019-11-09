class ChangeSenderToReceiverOnMessages < ActiveRecord::Migration[6.0]
  def change
    remove_column :messages, :sender
    add_column :messages, :subject, :string
  end
end
