require 'spec_helper'

describe User do
  before do
    User.delete_all
  end

  describe "validations" do
    let(:user) { User.new(email: "blake@gmail.com") }
    it "has a valid email" do
      expect(/\w+@\w+\.\w{3}/.match(user.email).to_s).to eq user.email
    end
  # describe "password matches"
  # end

    describe "username presence" do
      it "must be present" do
        expect(User.new(
                        name: nil,
                        email: "name@name.com",
                        address: "11 25th Ave Seattle, WA")
        ).to_not be_valid
      end

      it "must be unique" do
        expect(User.new(
                        name: "anne",
                        email: "name@name.com",
                        address: "11 25th Ave Seattle, WA")
        ).to_not be_valid
      end
    end

    describe "email address" do
      it "must be present" do
        expect(User.new(
                        name: "anne",
                        email: nil,
                        address: "11 25th Ave Seattle, WA")
        ).to_not be_valid
      end

      it "must be unique" do
        expect(User.new(
                        name: "anne",
                        email: "name@name.com",
                        address: "11 25th Ave Seattle, WA")
        ).to_not be_valid
      end
    end

    # describe "password" do
    #   pending "must match info in database" do
    #   end
    # end

    # # describe "relationships" do
    # #   pending "must have many products" do
    # #   end
    # # end
  end
end



# describe "User" do
#   let(:user) { create(:user) }
#   describe "validates" do
#     it "is valid" do
#       expect(user).to be_valid
#     end
    
#     it "username presence" do
#       user.update(username: nil)
#       expect(user.errors[:username]).to include "can't be blank"
#     end
    
#     it "email presence" do
#       user.update(email: nil)
#       expect(user.errors[:email]).to include "can't be blank"
#     end
    
#     it "email has a @" do
#       user.update(email: "b.com")
#       expect(user.errors[:email]).to include "is not a valid address"
#     end
    
#     it "email is unique" do
#       user2 = build(:user, email: user.email)
#       user2.valid?
#       expect(user2.errors[:email]).to include "has already been taken"
#     end

#     it "username is unique" do
#       user2 = build(:user, username: user.username)
#       user2.valid?
#       expect(user2.errors[:username]).to include "has already been taken"
#     end
    
#     # ADA-NOTE: In Rails a virtual attribute refers to an attr
#     # that is not in the DB. See:
#     # http://railscasts.com/episodes/16-virtual-attributes
#     it "a password virtual attribute" do
#       user = build(:user, password: nil)
#       user.valid?
#       expect(user.errors[:password]).to include "can't be blank"
#     end
    
#     it "a password_confirmation virtual attribute" do
#       user = build(:user, password_confirmation: nil)
#       user.valid?
#       expect(user.errors[:password_confirmation]).to include "can't be blank"
#     end
    
#     it "password and password_confirmation must match" do
#       user = build(:user, password: "gogo1234", password_confirmation: "gogo")
#       user.valid?
#       expect(user.errors[:password_confirmation]).to include "doesn't match Password"
#     end
    
#     it "password has at least 6 characters" do
#       user = build(:user, password: "gogo1", password_confirmation: "gogo1")
#       user.valid?
#       expect(user.errors[:password]).to include "must be at least 6 characters"
#     end

#     it "has many lists" do
#       user { should have_many(:list) }
#     end

#     it "has many list items" do
#       user { should have_many(:list_item) }
#     end

#   end
  
#   describe "#password_digest" do
#     it "exists after create" do
#       expect(user.password_digest).to_not be_nil
#     end
#   end
# end
