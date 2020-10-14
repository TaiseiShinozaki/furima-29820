require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end
  
    context '内容に問題ない場合' do
      it "imageとnameとdescriptionとcategory_idとcondition_idとpostage_payer_idとprefecture_idとhandling_time_idとpriceがあれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it "imageが空では登録できない事" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      
      it "nameが空では登録できない事" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "descriptionが空では登録できない事" do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it "category_idが1では登録できない事" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it "condition_idが1では登録できない事" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end

      it "postage_payer_idが1では登録できない事" do
        @item.postage_payer_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage payer must be other than 1")
      end

      it "prefecture_idが1では登録できない事" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it "handling_time_idが1では登録できない事" do
        @item.handling_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Handling time must be other than 1")
      end

      it "priceが空では登録できない事" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "priceが半角数字以外では登録できない事" do
        @item.price = "ああああ"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "priceが300円未満では登録できない事" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
    
      it "priceが10,000,000円以上だと登録できない事" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
    end
  end
end

