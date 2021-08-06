require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      display = FactoryBot.create(:display)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, display_id: display.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_address).to be_valid
      end
      it '建物名は空でも保存できること' do
        @purchase_address.house_name = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空だと保存できないこと' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        #binding.pry
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
        
      end
      it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_address.postal_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it '都道府県を選択していないと保存できないこと' do
        @purchase_address.area_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Area can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @purchase_address.house_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号がでは保存できないこと' do
        @purchase_address.telephone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it '電話番号が全角では保存できないこと' do
        @purchase_address.telephone_number = '１２３４５６７８９０'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone number is invalid.Input only number")
      end
      it '電話番号が英数混合では保存できないこと' do
        @purchase_address.telephone_number = '1234567abc'
        @purchase_address.valid?
        binding.pry
        expect(@purchase_address.errors.full_messages).to include("Telephone number is invalid.Input only number")
      end
      it '電話番号が9桁以下では保存できないこと' do
        @purchase_address.telephone_number = '123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Telephone number is invalid.Input only number')
      end
      it '電話番号が12桁以上では保存できないこと' do
        @purchase_address.telephone_number = 123456789012
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Telephone number is invalid.Input only number')
      end
      it "tokenが空では登録できないこと" do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
