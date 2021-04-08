require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it '登録情報が正しく入力されていれば、登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailに「@」が含まれていない場合は登録できないこと' do
      @user.email = @user.email.delete("@")
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it 'passwordが空では登録できないこと' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが6文字以上、英数字混合で登録できること' do
      @user.password = "12345a"
      @user.password_confirmation = @user.password
      expect(@user).to be_valid
    end
    it 'passwordが5文字以下では登録できないこと' do
      @user.password = "1234a"
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'passwordが数字のみでは登録できないこと' do
      @user.password = "123456"
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
    end
    it 'passwordが英字のみでは登録できないこと' do
      @user.password = "Abcdef"
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
    end
    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = "12345a"
      @user.password_confirmation = "A54321"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it '苗字(lastname)が全角ひらがなの場合、登録できること' do
      @user.last_name = Gimei.last.hiragana
      expect(@user).to be_valid
    end
    it '苗字(lastname)が全角カタカナの場合、登録できること' do
      @user.last_name = Gimei.last.katakana
      expect(@user).to be_valid
    end
    it '苗字(lastname)が空では登録できないこと' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it '苗字(lastname)が半角では登録できないこと' do
      @user.last_name = 'lastname'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name Full-width characters")
    end

    it '名前(firstname)が全角ひらがなの場合、登録できること' do
      @user.first_name = Gimei.first.hiragana
      expect(@user).to be_valid
    end
    it '名前(firstname)が全角カタカナの場合、登録できること' do
      @user.first_name = Gimei.first.katakana
      expect(@user).to be_valid
    end
    it '名前(firstname)が空では登録できないこと' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it '名前(firstname)が半角では登録できないこと' do
      @user.first_name = 'firstname'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name Full-width characters")
    end

    it 'フリガナ苗字(lastname)が空では登録できないこと' do
      @user.kana_last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana last name can't be blank")
    end
    it 'フリガナ苗字(lastname)が全角かなでは登録できないこと' do
      @user.kana_last_name = Gimei.last.hiragana
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana last name Full-width katakana characters")
    end
    it 'フリガナ苗字(lastname)が半角では登録できないこと' do
      @user.kana_last_name = 'lastname'
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana last name Full-width katakana characters")
    end
    it 'フリガナ名前(firstname)が空では登録できないこと' do
      @user.kana_first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana first name can't be blank")
    end
    it 'フリガナ名前(firstname)が全角かなでは登録できないこと' do
      @user.kana_first_name = Gimei.first.hiragana
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana first name Full-width katakana characters")
    end
    it 'フリガナ名前(firstname)が半角では登録できないこと' do
      @user.kana_first_name = 'firstname'
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana first name Full-width katakana characters")
    end
    it '生年月日が空では登録できないこと' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
