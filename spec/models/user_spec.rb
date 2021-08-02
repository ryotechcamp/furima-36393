require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全ての項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpasswod_confirmationが6文字以上あれば登録できる' do
        @user.password = 'aaa000'
        @user.password_confirmation = 'aaaooo'
      end
    end
    
    context '新規登録できないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'メールアドレスが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        anaothor_user = FactoryBot.build(:user)
        anaothor_user.email = @user.email
        anaothor_user.valid?
        expect(anaothor_user.errors.full_messages).to include('Email has already been taken')
      end
      it '@を含まなければ登録できない' do
        @user.email = 'aaa.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードが5文字以下だと登録できない' do
        @user.password = 'aaa11'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードが英語のみだと登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
      it 'パスワードが数字のみだと登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない」' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordとpassword_confirmationが一致していなければ登録できない' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'bbb222'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'お名前（名前）が空だと登録できない' do
        @user.kanji_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanji first name can't be blank")
      end
      it 'お名前（名前）が全角以外だと登録できない' do
        @user.kanji_first_name = 'ryo'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanji first name is invalid. Input full-width characters")
      end
      it 'お名前（苗字）が空だと登録できない' do
        @user.kanji_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanji last name can't be blank")
      end
      it 'お名前（苗字）が全角以外だと登録できない' do
        @user.kanji_last_name = 'kato'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanji last name is invalid. Input full-width characters")
      end
      it 'お名前カナ（名前）が空だと登録できない' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank")
      end
      it 'お名前カナ（名前）が全角以外だと登録できない' do
        @user.kana_first_name = 'ﾘｮｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name is invalid. Input full-width characters")
      end
      it 'お名前カナ（苗字）が空だと登録できない' do
        @user.kana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name can't be blank")
      end
      it 'お名前カナ（苗字）が全角以外だと登録できない' do
        @user.kana_last_name = 'ｶﾄｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name is invalid. Input full-width characters")
      end
      
      it '誕生日が空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end


    end
      
  end

end

