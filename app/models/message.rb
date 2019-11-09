class Message < ApplicationRecord
  before_save {receiver.downcase}
end
