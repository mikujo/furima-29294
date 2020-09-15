require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '新規登録がうまくいく時' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかない時' do
      it 'nicknameが空だと保存できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空だと保存できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに＠が含まれていないと登録できないこと' do
        @user.email = 'testcom'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空だと保存できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できないこと' do
        @user.password = '11111'
        @user.password_confirmation = '11111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角英数字混合でないと登録できないこと' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
        @user.password ='aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'password_confirmationが空だと保存できないこと' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'first_nameが空だと保存できないこと' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", 'First name is invalid')
      end
      it 'first_nameが全角日本語でないと登録できないこと' do
        @user.first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'last_nameが空だと保存できないこと' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", 'Last name is invalid')
      end
      it 'last_nameが全角日本語でないと登録できないこと' do
        @user.last_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it 'first_name_leadingが空だと保存できないこと' do
        @user.first_name_leading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name leading can't be blank", 'First name leading is invalid')
      end
      it 'first_name_leadingが全角カタカナでないと登録できないこと' do
        @user.first_name_leading = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name leading is invalid')
      end
      it 'last_name_leadingが空だと保存できないこと' do
        @user.last_name_leading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name leading can't be blank", 'Last name leading is invalid')
      end
      it 'last_name_leadingが全角カタカナでないと登録できないこと' do
        @user.last_name_leading = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name leading is invalid')
      end
      it 'birthdayが空だと保存できないこと' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
