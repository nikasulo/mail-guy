class Message < ApplicationRecord
  before_save {reciever.downcase}
end
