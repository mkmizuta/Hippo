require 'spec_helper'

describe UsersController do
  let(:authenticated_user) {
    double("authenticated user", {
      :id => 2,
     })
  }

  describe 'GET #show' do
    it 'shows all users'
  end

  describe 'GET #new' do
    it 'should render the new template'
    it 'is a redirect'
  end

  describe 'POST #create', wip: true do
    before do
      subject.stub(current_user: authenticated_user)
    end
    let(:valid_attributes) { {
      name:        "Foo Product",
      description: "Bar Baz Bat",
      price:       123,
      inventory:   7,
    } }
    let(:invalid_attributes) { valid_attributes.except(:name) }

    context 'with valid attributes' do
      it 'should create a new product' do
        expect{
          post :create, product: valid_attributes
        }.to change(Product, :count).by(1)
      end

      it "should associate the new product with the current user" do
        post :create, product: valid_attributes

        expect(Product.last.user_id).to eq(authenticated_user.id)
      end

      it "redirects to the new product" do
        post :create, product: valid_attributes

        expect(response).to redirect_to("/products/#{Product.last.id}")
      end
    end

    context 'with invalid attributes' do
      it "should not create a new product" do
        expect{
          post :create, product: invalid_attributes
        }.not_to change(Product, :count)
      end

      it 'redirects with a flash message' do
        post :create, product: invalid_attributes

        expect(flash[:notice]).to include('There was an error')
        expect(response).to redirect_to("/products/new")
      end
    end
  end

  describe 'POST #edit' do
    it 'locates the requested product'
  end

  describe 'PATCH #update' do
    context 'with valid attributes' do
      it 'locates the requested product'
      it 'updates the products attributes'
      it 'redirects to product show page'
    end

    context 'with invalid attributes' do
      it 'does not update the products attributes'
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the products and changes the count by -1'
  end

  describe 'GET #search_by_name' do
    it 'retrieves product that was searched'
  end

end


describe UsersController do

  describe 'GET #new' do
    it 'assigns @user as an instance of User' do 
      let(:user) { create(:user) }
      get :new
      expect(@user).to be_an_instance_of(:user)
    end
  end

  describe "POST 'create'" do 
    context 'with valid attributes' do 
      let(:user) { create(:user) }

      it 'increases user count by 1' do
        expect { post :create, user: user}.to change(User, :count).by(1)
      end

      it 'redirects to root path' do
        post :create, user: user
        expect(response).to redirect_to root_path
      end

      it 'creates new session' do 
        post :create, user: user
        assigns(session[:user_id]).to == user.id 
      end
    end

    context 'with invalid attributes' do
      let(:invalid_user) { create(:invalid_user) } 
      it 'renders new template' do 
        post :create, user: invalid_user
        expect(response).to render_template :new
      end

      it 'sets a flash notice' do 
        post :create, user: invalid_user
        expect(:notice).to include 'There was a problem saving this user! :('
      end
    end
  end
end
