class Message < ApplicationRecord
  before_save {receiver.downcase}

  validates :body, presence: true
  validates :subject, presence: true
  validates :receiver, presence: true
end
