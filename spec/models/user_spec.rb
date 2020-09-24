require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "全ての入力項目が存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "abCD12"
        @user.password_confirmation = "abCD12"
        expect(@user).to be_valid
      end
      it "ユーザー本名は全角(漢字・ひらがな・カタカナ)であれば登録できる" do
        @user.first_name = "亜あア"
        @user.last_name = "亜あア"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailに＠が含まれていないと登録できない" do
        @user.email = "aaaa_bbb.gmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが数字のみでは登録できない" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it "passwordが英字のみでは登録できない" do
        @user.password = "abcDEF"
        @user.password_confirmation = "abcDEF"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "ユーザー本名が、名字のみだと登録できない。" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "ユーザー本名が、名前のみだと登録できない。" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "ユーザー本名が半角英字だと登録できない。" do
        @user.first_name = "abcd"
        @user.last_name = "abcd"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Full-width characters","Last name Full-width characters")
      end
      it "ユーザー本名が半角数字だと登録できない。" do
        @user.first_name = "1234"
        @user.last_name = "1234"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Full-width characters","Last name Full-width characters")
      end
      it "ユーザー本名が全角英字だと登録できない。" do
        @user.first_name = "ａｂｃｄ"
        @user.last_name = "ａｂｃｄ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Full-width characters","Last name Full-width characters")
      end
      it "ユーザー本名が全角数字だと登録できない。" do
        @user.first_name = "１２３４"
        @user.last_name = "１２３４"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Full-width characters","Last name Full-width characters")
      end
      it "ユーザー本名のフリガナが名字のみだと登録できない。" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "ユーザー本名のフリガナが名前のみだと登録できない。" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "ユーザー本名のフリガナの名字が半角英字だと登録できない。" do
        @user.first_name_kana = "abcd"
        @user.last_name_kana = "abcd"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters","Last name kana Full-width katakana characters")
      end
      it "ユーザー本名のフリガナが半角数字だと登録できない。" do
        @user.first_name_kana = "1234"
        @user.last_name_kana = "1234"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters","Last name kana Full-width katakana characters")
      end
      it "ユーザー本名のフリガナが全角英字だと登録できない。" do
        @user.first_name_kana = "ａｂｃｄ"
        @user.last_name_kana = "ａｂｃｄ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters","Last name kana Full-width katakana characters")
      end
      it "ユーザー本名のフリガナが全角数字だと登録できない。" do
        @user.first_name_kana = "１２３４"
        @user.last_name_kana = "１２３４"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters","Last name kana Full-width katakana characters")
      end
      it "ユーザー本名のフリガナが半角カタカナだと登録できない。" do
        @user.first_name_kana = "ｱｲｳｴｵ"
        @user.last_name_kana = "ｱｲｳｴｵ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters","Last name kana Full-width katakana characters")
      end
      it "生年月日が空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end