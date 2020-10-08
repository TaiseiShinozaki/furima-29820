require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '内容に問題ない場合' do
        it "nicknameとemailとpasswordとpassword_confirmationとfirst_nameとlast_nameとfirst_name_kanaとlast_name_kanaとbirth_dateがあれば登録できる" do
          expect(@user).to be_valid
        end

        it "passwordが6文字以上であれば登録できること" do
          @user.password = "pas123"
          @user.password_confirmation = "pas123"
          expect(@user).to be_valid
        end
    end

    context '内容に問題がある場合' do
        it "nicknameが空では登録できないこと" do
          @user.nickname = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
    
        it "emailが空では登録できないこと" do
          @user.email = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
    
        it "重複したemailが存在する場合登録できないこと" do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end

        it "emailに@がない場合登録できないこと" do
          @user.email = "testtestgmail.com"
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end

        it "passwordが空では登録できないこと" do
          @user.password = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it "passwordが数字のみでは登録できないこと" do
          @user.password = "123456"
          @user.password_confirmation = "123456"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password Please set the password including both letters and numbers")
        end

        it "passwordが英字のみでは登録できないこと" do
          @user.password = "abcdef"
          @user.password_confirmation = "abcdef"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password Please set the password including both letters and numbers")
        end

        it "passwordとpassword_confirmationが不一致では登録できないこと" do
          @user.password = "heroku1234"
          @user.password_confirmation = "heroku12345"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it "first_nameが空では登録できないこと" do
          @user.first_name = nil
          @user.valid?
          # binding.pry
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end

        it "first_nameが全角漢字・ひらがな・カタカナ以外では登録できないこと" do
          @user.first_name = "tanaka"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name 全角漢字・ひらがな・カタカナで入力してください")
        end

        it "last_nameが空では登録できないこと" do
          @user.last_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end

        it "last_nameが全角漢字・ひらがな・カタカナ以外では登録できないこと" do
          @user.last_name = "taro"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name 全角漢字・ひらがな・カタカナで入力してください")
        end

        it "first_name_kanaが空では登録できないこと" do
          @user.first_name_kana = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank")
        end

        it "first_name_kanaが全角カナ文字以外では登録できないこと" do
          @user.first_name_kana = "太郎"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana 全角カタカナで入力してください")
        end
    
        it "last_name_kanaが空では登録できないこと" do
          @user.last_name_kana = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana can't be blank")
        end
    
        it "last_name_kanaが全角カナ文字以外では登録できないこと" do
          @user.last_name_kana = "田中"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana 全角カタカナで入力してください")
        end
    
        it "birth_dateが空では登録できないこと" do
          @user.birth_date = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Birth date can't be blank")
        end
    end
  end
end
