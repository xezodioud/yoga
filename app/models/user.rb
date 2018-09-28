class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :subscribe_user_to_mailing_list

  private

  def subscribe_user_to_mailing_list
  	SubscribeUserToMailingListJob.perform_later(self)

  end 
end


