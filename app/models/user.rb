class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :first_name, presence: { message: "First Name cannot be blank" }
         validates :last_name, presence: { message: "Last Name cannot be blank" }
end
