require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録機能' do
    context '新規登録成功' do
      it 'nickname, email, password, password_confirmation, last_name, first_name, last_name_kana, first_name_kana, birthのデータが存在する場合、正常に登録できる' do
        @user.valid?
      end
      it 'passwordは6文字以上かつ半角英数字を両方含む場合、正常に登録できる' do
        @user.password = 'abf45jd'
        @user.password_confirmation = @user.password
        @user.valid?
      end
    end

    context '新規登録失敗' do
      it 'nicknameが空の場合、登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空の場合、登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空の場合、登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'last_nameが空の場合、登録できない' do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_nameが空の場合、登録できない' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_name_kanaが空の場合、登録できない' do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'first_name_kanaが空の場合、登録できない' do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'birthが空の場合、登録できない' do
        @user.birth = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth can't be blank")
      end
      it 'passwordが６文字未満の場合、登録できない' do
        @user.password = 'a3vkd'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角英字のみの場合、登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 半角英数字を両方含んで入力してください')
      end
      it 'passwordが半角数字のみの場合、登録できない' do
        @user.password = '489325'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 半角英数字を両方含んで入力してください')
      end
      it 'passwordが半角英数字以外の文字列を含む場合、登録できない' do
        @user.password = 'de@dji45'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 半角英数字を両方含んで入力してください')
      end
      it 'passwordとpassword_confirmationが一致しない場合、登録できない' do
        @user.password = 'dedji45'
        @user.password_confirmation = '7ji2jkc'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'emailが重複している場合、登録できない' do
        dummy_user = FactoryBot.create(:user)
        @user.email = dummy_user.email
        @user.valid?
        expect(@user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@がない場合、登録できない' do
        @user.email = 'tanakakeiji'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'last_nameが半角文字の場合、登録できない' do
        @user.last_name = 'ﾊﾝｶｸ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name 全角文字で入力してください')
      end
      it 'first_nameが半角文字の場合、登録できない' do
        @user.first_name = 'ﾊﾝｶｸ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角文字で入力してください')
      end
      it 'last_name_kanaが全角カタカナ以外の場合、登録できない' do
        @user.last_name_kana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana 全角カナで入力してください')
      end
      it 'first_name_kanaが全角カタカナ以外の場合、登録できない' do
        @user.first_name_kana = 'たいが'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana 全角カナで入力してください')
      end
    end
  end
end
