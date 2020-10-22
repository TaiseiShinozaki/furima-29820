require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '#create' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    context '内容に問題ない場合' do
      it "tokenとpost_codeとprefecture_idとcityとtownとphone_numberがあれば登録できる" do
        expect(@order_address).to be_valid
      end
    
      it "phone_numberはハイフンなしで11桁以内であれば登録できる事" do
        @order_address.phone_number = "09012345678"
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it "tokenが空では登録できない事" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    
      it "post_codeが空では登録できない事" do
        @order_address.post_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end

      it "post_codeにハイフンがない場合登録できない事" do
        @order_address.post_code = "2101234"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code Input correctly")
      end
  
      it "post_codeの値が正しくない場合登録できない事" do
        @order_address.post_code = "ああああああ"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code Input correctly")
      end

      it "prefecture_idが1では登録できない事" do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it "cityが空では登録できない事" do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it "townが空では登録できない事" do
        @order_address.town = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Town can't be blank")
      end

      it "phone_numberが空では登録できない事" do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
    
      it "phone_numberの値が正しくない場合登録できない事" do
        @order_address.phone_number = "０９０１２３４５６７８"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number Input only number")
      end
    end
  end
end


