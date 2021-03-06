require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe 'オーダーの保存' do
    before do
      @user = FactoryBot.build(:user)
      @item = FactoryBot.build(:item)
      @order_address = FactoryBot.build(:order_address,user_id: @user.id,item_id: @item.id)
    end
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it '建物名が空でも購入できること' do
        @order_address.building_name = ""
        expect(@order_address).to be_valid
      end
    end
    context '内容に不備がある場合' do
      it 'tokeがないと保存されない' do
        @order_address.token = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("トークンを入力してください")
      end
      it 'postal_codeがないと保存できないこと' do
        @order_address.postal_code = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'postal_codeにハイフンが３桁ハイフン４桁でないと保存されない' do
        @order_address.postal_code = "1234-567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号は以下のように入力してください(123-4567)")
      end
      it 'postal_codeにハイフンが含まれないと保存されない' do
        @order_address.postal_code = "1234567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号は以下のように入力してください(123-4567)")
      end
      it 'user_idがないと保存されない' do
        @order_address.user_id = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Userを入力してください")
      end
      it 'item_idがないと保存されない' do
        @order_address.item_id = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Itemを入力してください")
      end
      it 'prefecture_idがないと保存されない' do
        @order_address.prefecture_id = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("発送元の地域を入力してください")
      end
      it 'prefecture_idが0の時保存されない' do
        @order_address.prefecture_id  = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("発送元の地域を入力してください")
      end
      it 'cityがないと保存されない' do
        @order_address.city = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'house_numberがないと保存されない' do
        @order_address.house_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("番地を入力してください")
      end
      it '電話番号が英数混合では登録できないこと' do
        @order_address.phone_number = "1a2b3c4d5f6"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'phone_numberが10桁以下だと保存されない' do
        @order_address.phone_number = "123456789"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'phone_numberが12桁以上だと保存されない' do
        @order_address.phone_number = "123456789101"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'phone_numberにハイフンが含まれると保存されない' do
        @order_address.phone_number = "1234-567890"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'phone_numberが全角数字では保存されない' do
        @order_address.phone_number = "１２３４５６７８９０"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は不正な値です")
      end
    end
  end
end
