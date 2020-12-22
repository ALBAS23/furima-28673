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

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: PASSWORD_REGEX, message: '半角英数字を両方含んで入力してください' }

  names = [:last_name, :first_name]
  names.each do |name|
    validates name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字で入力してください'}
  end

  kanas = [:last_name_kana, :first_name_kana]
  kanas.each do |kana|
    validates kana, format: { with: /\A[ァ-ヶ]+\z/, message: '全角カナで入力してください'}
  end
end
