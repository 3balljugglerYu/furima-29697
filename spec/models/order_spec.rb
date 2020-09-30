require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  describe '決済処理' do
    before do
      @payment = FactoryBot.build(:order_shipping)
    end

    context '決済処理がうまくいくとき' do
      it 'すべての値が正しく入力されていれば決済処理が完了できること' do
        expect(@payment).to be_valid
      end
    end
    
    context '決済処理がうまくいかないとき' do
      it 'tokenが空では決済処理できない' do
        @payment.token = ""
        @payment.valid?
        expect(@payment.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が空では決済処理できない' do
        @payment.postal_code = ""
        @payment.valid?
        expect(@payment.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号の入力で"-"の記載がないと、決済処理できない' do
        @payment.postal_code = "1234567"
        @payment.valid?
        expect(@payment.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it '発送先の地域を選択していないと登録できない' do
        @payment.prefecture_id = 0
        @payment.valid?
        expect(@payment.errors.full_messages).to include("Prefecture Select")
      end

      it '市区町村が空では決済処理できない' do
        @payment.city = ""
        @payment.valid?
        expect(@payment.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空では決済処理できない' do
        @payment.addresses = ""
        @payment.valid?
        expect(@payment.errors.full_messages).to include("Addresses can't be blank")
      end

      it '電話番号が空では決済処理できない' do
        @payment.phone_number = ""
        @payment.valid?
        expect(@payment.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号に"-"があると決済処理できない' do
        @payment.phone_number = "090-1234-5678"
        @payment.valid?
        expect(@payment.errors.full_messages).to include("Phone number is invalid. No hyphen (-) required")
      end
    end
  end
end
