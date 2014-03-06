require 'spec_helper'
describe UsersController do

  describe "GET 'new'" do
    it "is successful" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "POST 'create'" do
    context "with valid attributes" do
      let(:valid_attributes) { {
          name: "Ada Doe",
          email: "ada@adadoe.com",
          password: "gogo1234",
          password_confirmation: "gogo1234"
      } }

      it "is a redirect" do
        post :create, user: valid_attributes
        expect(response.status).to eq 302
      end

      it "changes user count by 1" do
        expect { post :create,
                      user: valid_attributes }.to change(User, :count).by(1)
      end

      it "sets a flash message" do
        post :create, user: valid_attributes
        expect(flash[:notice]).to_not be_blank
      end
    end

    context "with invalid attributes" do
      it "renders the new template" do
        post :create, user: { name: "",
                              email: "ada@adadoe.com",
                              password: "gogo1234",
                              password_confirmation: "gogo1234" }
        expect(response).to render_template :new
      end

      it "does not create a user" do
        expect { post :create, user: { name: "" } }
        .to change(User, :count).by(0)
      end
    end
  end

  describe "GET 'show'" do
    let(:user) { FactoryGirl.create(:user) }

    it "is successful" do
      get :show, id: user.id
      expect(response).to be_successful
    end
  end
end
