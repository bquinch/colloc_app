require 'rails_helper'
begin
  require "flat_users_controller"
rescue LoadError
end

if defined?(FlatUsersController)
  RSpec.describe FlatUsersController, :type => :controller do
    login_user
    create_flat

    let(:valid_attributes) do
      {
        flat: Flat.last,
        user: User.last,
        flat_code: Flat.last.flat_code
      }
    end

    let(:invalid_attributes) do
      {
        flat: nil,
        flat_code: '',
        user: nil
      }
    end

    describe "GET new" do
      it "assigns a new flat_user as @flat_user" do
        get :new, params: {}
        expect(assigns(:flat_user)).to be_a_new(FlatUser)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new FlatUser" do
          expect {
            post :create, params: {:flat_user => valid_attributes}
          }.to change(FlatUser, :count).by(1)
        end

        it "assigns a newly created flat_user as @flat_user" do
          post :create, params: {:flat_user => valid_attributes}
          expect(assigns(:flat_user)).to be_a(FlatUser)
          expect(assigns(:flat_user)).to be_persisted
        end

        it "redirects to the flat_user's flat" do
          post :create, params: {:flat_user => valid_attributes}
          expect(response).to redirect_to(Flat.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved flat_user as @flat_user" do
          post :create, params: {:flat_user => invalid_attributes}
          expect(assigns(:flat_user)).to be_a_new(FlatUser)
        end

        it "re-renders the 'new' template" do
          post :create, params: {:flat_user => invalid_attributes}
          expect(response).to render_template("new")
        end
      end
    end
  end

else
  describe "FlatUsersController" do
    it "should exist" do
      expect(defined?(FlatUsersController)).to eq(true)
    end
  end
end
