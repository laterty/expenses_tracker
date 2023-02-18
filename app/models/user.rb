# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :expenses, dependent: :destroy
  has_many :sended_expenses, class_name: 'ExpenseSharing', foreign_key: 'sender_id', dependent: :destroy,
                             inverse_of: :sender
  has_many :shared_expenses, class_name: 'ExpenseSharing', foreign_key: 'recipient_id', dependent: :destroy,
                             inverse_of: :recipient
  has_many :followed, class_name: 'User', through: :shared_expenses, source: :sender
  has_many :followings, class_name: 'User', through: :sended_expenses, source: :recipient
end
