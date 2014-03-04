require 'spec_helper'

describe UsersController do
   # let(:user) { create(:user) }
   #  before do 
   #    session[:id] = user.id
   #  end


  describe 'GET #new' do 
    it 'assigns @user as an instance of User' do 
      let(:user) { create(:user) }
      get :new
      expect(response).to be_successful
    end
  end


  describe 'POST #create' do 
    context 'with valid attributes' do 
      let(:user) { create(:user) }
      let(:valid_attributes) { {username: 'Ada Doe',
                                email: 'ada@adadoe.com',
                                password: 'gogo1234',
                                password_confirmation: 'gogo1234'} }
      it "is a redirect" do
        post :create, user: valid_attributes
        expect(response.status).to eq 302 # This is a redirect
      end
    end
  end
    
  #     it "changes user count by 1" do
  #       expect { post :create, user: valid_attributes }.to change(User, :count).by(1)
  #     end
    
  #     it "sets a flash message" do
  #       post :create, user: valid_attributes
  #       expect(flash[:notice]).to_not be_blank
  #     end
  #   end
  
  #   context "with invalid attributes" do
  #     it "renders the new template" do
  #       post :create, user: {username: "b"}
  #       expect(response).to render_template :new
  #     end
    
  #     it "does not create a user" do
  #       expect { post :create, user: {username: "b"} }.to change(User, :count).by(0)
  #     end
  #   end
  # end

  # describe "GET 'show'" do
  #   let(:user) { create(:user) }
    
  #   it "is successful" do
  #     get :show, id: user.id
  #     expect(response).to be_successful
  #   end
  # end
end







# ===========
#   describe "PATCH 'update'" do
#       let(:user) { create(:user) }
#       before do 
#         session[:id] = user.id
#       end

#       it "redirects to @users profile page" do
#         patch :update, user: {email: "b@email.com"}
#         expect(response).to redirect_to user_path
#       end

#       context "with invalid attributes" do
#         it "renders the new email template" do
#           patch :update, user: {email: "b.com"}
#           expect(response).to render_template :email
#         end
#       end 
#     end

#     describe "GET 'show'" do
#       let(:user) { create(:user) }
      
#       it "is successful" do
#         get :show, id: user.id
#         expect(response).to be_successful
#       end
#     end
#   end
#   describe "user access" do
#     before :each do
#       user = create(:user)
#       session[:user_id] = user.id
#     end
#   end

#   describe 'GET #new' do
#     it 'assigns @user as an instance of User' do 
#       let(:user) { create(:user) }
#       get :new
#       expect(@user).to be_an_instance_of(:user)
#     end
#   end

#   describe "POST 'create'" do 
#     context 'with valid attributes' do 
#       let(:user) { create(:user) }

#       it 'increases user count by 1' do
#         expect { post :create, user: user}.to change(User, :count).by(1)
#       end

#       it 'redirects to root path' do
#         post :create, user: user
#         expect(response).to redirect_to root_path
#       end

#     end

#     context 'with invalid attributes' do
#       let(:invalid_user) { create(:invalid_user) } 
#       it 'renders new template' do 
#         post :create, user: invalid_user
#         expect(response).to render_template :new
#       end

#       it 'sets a flash notice' do 
#         post :create, user: invalid_user
#         expect(:notice).to include 'There was a problem saving this user! :('
#       end
#     end
#   end




# =========
  # describe 'GET #show' do
  #   it 'shows all users'
  # end

  # describe 'GET #new' do
  #   it 'should render the new template'
  #   it 'is a redirect'
  # end

  # describe 'POST #create', wip: true do
  #   before do
  #     subject.stub(current_user: authenticated_user)
  #   end
  #   let(:valid_attributes) { {
  #     name:  "Ada Doe",
  #     email: "ada@adadoe.com",
  #     password: "123456",
  #     password_confirmation: "123456",
  #   } }
  #   let(:invalid_attributes) { valid_attributes.except(:name) }

  #   context 'with valid attributes' do
  #     it 'should create a new user' do
  #       expect{
  #         post :create, user: valid_attributes
  #       }.to change(User, :count).by(1)
  #     end

  #     it "redirects to the home page upon save" do
  #       post :create, user: FactoryGirl.attributes_for(:user) expect(response).to redirect_to 'users#show'
  #     end

  #     it 'creates new session' do 
  #       post :create, user: valid_attributes
  #       assigns(session[:user_id]).to == user.id 
  #     end
  #     # it "should associate the new user as the current user" do
  #     #   post :create, user: valid_attributes

  #     #   expect(User.last.id).to eq(authenticated_user.id)
  #     # end

  #     # it "redirects to the new product" do
  #     #   post :create, product: valid_attributes

  #     #   expect(response).to redirect_to("/products/#{Product.last.id}")
  #     # end
  #   end

  #   context 'with invalid attributes' do
  #     it "should not create a new user" do
  #       expect{
  #         post :create, user: invalid_attributes
  #       }.not_to change(User, :count)
  #     end

  #     it 'redirects with a flash message' do
  #       post :create, user: invalid_attributes

  #       expect(flash[:notice]).to include('There was an error')
  #       expect(response).to redirect_to("/users/new")
  #     end
  #   end
  # end

  # describe 'POST #edit' do
  #   it 'locates the requested user profile'
  # end

  # describe 'PATCH #update' do
  #   context 'with valid attributes' do
  #     it 'locates the requested product'
  #     it 'updates the products attributes'
  #     it 'redirects to product show page'
  #   end

  #   context 'with invalid attributes' do
  #     it 'does not update the products attributes'
  #   end
  # end

  # describe 'DELETE #destroy' do
  #   it 'deletes the user and changes the count by -1'
  # end




# ==========================
# 
