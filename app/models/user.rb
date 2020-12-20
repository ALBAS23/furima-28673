class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  columns = [:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth]

  with_options presence: true do
    columns.each do |column|
      validates column
  end

  validates :password, format: {with: /\A[a-z\d]{6}+\z/i, message: "半角英数字で入力してください"}
  
end
