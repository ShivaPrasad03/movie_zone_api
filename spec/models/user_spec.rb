require 'rails_helper'

RSpec.describe User, type: :model do
  context "respec validations" do  
      let(:user) { User.create(name: nil,email:"shiva@mail.com",password:"123456") }

      it "validate presence of name" do  
        expect(user.valid?).to eq(false)  
      end

  end
end
