require 'rails_helper'

RSpec.describe Display, type: :model do
  before do
    @display = FactoryBot.build(:display)
  end

  describe '商品出品情報' do
    it '全てのデータがあれば保存できる' do
      expect(@display).to be_valid
    end
    it '画像が空だと登録できない' do
      @display.image = nil
      @display.valid?
      expect(@display.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が空だと登録できない' do
      @display.display_name = ''
      @display.valid?
      expect(@display.errors.full_messages).to include("Display name can't be blank")
    end
    it '説明文が空だと登録できない' do
      @display.instruction = ''
      @display.valid?
      expect(@display.errors.full_messages).to include("Instruction can't be blank")
    end
    it 'ジャンルが「--」だと登録できない' do
      @display.genre_id = '1'
      @display.valid?
      expect(@display.errors.full_messages).to include("Genre can't be blank")
    end
    it '状態が「--」だと登録できない' do
      @display.status_id = '1'
      @display.valid?
      expect(@display.errors.full_messages).to include("Status can't be blank")
    end
    it '負担が「--」だと登録できない' do
      @display.load_id = '1'
      @display.valid?
      expect(@display.errors.full_messages).to include("Load can't be blank")
    end
    it '地域が「--」だと登録できない' do
      @display.area_id = '1'
      @display.valid?
      expect(@display.errors.full_messages).to include("Area can't be blank")
    end
    it '日数が「--」だと登録できない' do
      @display.day_id = '1'
      @display.valid?
      expect(@display.errors.full_messages).to include("Day can't be blank")
    end
    it '価格が空白だと登録できない' do
      @display.price = ''
      @display.valid?
      expect(@display.errors.full_messages).to include("Price can't be blank")
    end
    it '価格が300円未満だと登録できない' do
      @display.price = '299'
      @display.valid?
      expect(@display.errors.full_messages).to include("Price is out of setting range")
    end
    it '価格が10000000円以上だと登録できない' do
      @display.price = '10000000'
      @display.valid?
      expect(@display.errors.full_messages).to include("Price is out of setting range")
    end
    it '価格が全角だと登録できない' do
      @display.price = '８００'
      @display.valid?
      expect(@display.errors.full_messages).to include("Price is out of setting range")
    end
    
  end
  
end
