require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item) 
  end

  describe 'ユーザー出品機能' do
    context '新規登録がうまくいくとき' do
      it '全ての入力項目が存在すれば出品できる' do
        expect(@item).to be_valid
      end

      it '販売価格は300円から出品できる' do
        @item.price = '300'
        expect(@item).to be_valid
      end

      it '販売価格は9,999,999円まで出品できる' do
        @item.price = '9999999'
        expect(@item).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "商品名が空だと出品できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "商品説明が空だと出品できない" do
        @item.text = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end

      it "カテゴリーを選択していないと登録できない" do
        @item.category_id  = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end

      it "商品の状態を選択していないと登録できない" do
        @item.sales_status_id  = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status must be other than 0")
      end

      it "配送料の負担を選択していないと登録できない" do
        @item.shipping_fee_status_id  = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status must be other than 0")
      end

      it "発送元の地域を選択していないと登録できない" do
        @item.prefecture_id  = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
      end

      it "発送までの日数を選択していないと登録できない" do
        @item.scheduled_delivery_id  = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery must be other than 0")
      end

      it "販売価格が空だと登録できない" do
        @item.price  = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "販売価格が300円未満だと登録できない" do
        @item.price  = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end

      it "販売価格が10,000,000円以上だと登録できない" do
        @item.price  = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end

      it "販売価格が半角英字だと登録できない" do
        @item.price  = "aaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end

      it "販売価格が全角数字だと登録できない" do
        @item.price  = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end

      it "販売価格がひらがなだと登録できない" do
        @item.price  = "あああ"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end

      it "販売価格が漢字だと登録できない" do
        @item.price  = "亜亜亜"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end

      it "販売価格がカタカナだと登録できない" do
        @item.price  = "アアア"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end

      it "販売価格が半角カタカナだと登録できない" do
        @item.price  = "ｱｱｱ"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
    end
  end
end