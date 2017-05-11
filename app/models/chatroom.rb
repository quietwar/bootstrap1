class Chatroom < ApplicationRecord
    belongs_to :user
    has_many :messages, dependent: :destroy

    has_many :personal_messages, -> { order(created_at: :asc) }, dependent: :destroy

    accepts_nested_attributes_for :messages

    validates :Genius, uniqueness: {scope: :receiver}



    def with(current_user)
      Genius == current_user ? receiver : author
    end

    def participates?(user)
      Genius == user || receiver == user
    end

end
