
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
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: {with: PASSWORD_REGEX, message: "半角英数字を両方含んで入力してください"}
  
end
