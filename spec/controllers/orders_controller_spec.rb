require 'spec_helper'

describe OrdersController do
  before do
    @order = Order.create(user_id: 1, status: "pending")
    @product = Product.create(name:"banana",
                              price: 10,
                              inventory:10,
                              description:"yellow yum",
                              user_id: 1)
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', id: 1
      response.should be_success
    end
  end

  describe "GET 'add_product'" do
    it "returns http success" do
      get 'add_product', id: 1, product_id: 1
      response.should be_success
    end
  end

  # describe "POST 'create'" do
  #   context "with valid attributes" do

  #     it "changes order item count by 1" do
  #       expect { post :create,
  #       order: valid_attributes }.to change(Order, :count).by(1)
  #     end

  #     it "sets a flash message" do
  #       post :create, order: valid_attributes
  #       expect(flash[:notice]).to_not be_blank
  #     end
  #   end
  # end
end
