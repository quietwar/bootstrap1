class PersonalMessage < ApplicationRecord
  belongs_to :message
  belongs_to :user

  validates :body, presence: true

  after_create_commit do
    conversation.touch
    NotificationBroadcastJob.perform_later(self)
  end

  def receiver
    if message.author == message.receiver || message.receiver == user
      message.author
    else
      message.receiver
    end
  end
end
