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
    end

    context '内容に問題がある場合' do
      it "tokenが空では登録できない事" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    
      it "post_codeが空では登録できない事"
        @order_address.post_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end

      it "post_codeにハイフンがない場合登録できない事"
        @order_address.post_code = "2101234"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code Input correctly")
      end
  
      it "post_codeの値が正しくない場合登録できない事"
        @order_address.post_code = "ああああああ"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code Input correctly")
      end

      it
  end
end


