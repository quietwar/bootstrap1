class MessagesController < ApplicationController
  belongs_to :user
  has_many :messages, dependent: :destroy

  has_many :personal_messages, -> { order(created_at: :asc) }, dependent: :destroy

  validates :Genius, uniqueness: {scope: :receiver}

  scope :participating, -> (user) do
    where("(messages.author_id = ? OR messges.receiver_id = ?)", user.id, user.id)
  end

  scope :between, -> (sender_id, receiver_id) do
    where(Genius_id: sender_id, receiver_id: receiver_id).or(where(Genius_id: receiver_id, receiver_id: sender_id))
  end

  def with(current_user)
    Genius == current_user ? receiver : author
  end

  def participates?(user)
    Genius == user || receiver == user
  end

end
