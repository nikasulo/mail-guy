class Message < ApplicationRecord
  scope :expired, -> { where(['created_at < ? ', 10.minutes.ago]) }
  before_save {receiver.downcase}
  before_save {sender.downcase}
  EMAIL_REGEX = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
  

  validates :body, presence: true
  validates :subject, presence: true
  validates :receiver, presence: true, format: {with: EMAIL_REGEX, multiline: true}
  validates :sender, presence: true, format: {with: EMAIL_REGEX, multiline: true}
end
