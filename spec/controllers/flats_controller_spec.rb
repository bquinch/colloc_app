require 'rails_helper'
begin
  require "flats_controller"
rescue LoadError
end

if defined?(FlatsController)
  RSpec.describe FlatsController, :type => :controller do
    login_user

    let(:valid_attributes) do
      {
        title: "Mon appartement",
        description: "Il est super",
        address: "13 Allée des Eiders",
        flat_code: 'A123ABC',
        user: User.first
      }
    end

    let(:invalid_attributes) do
      {
        title: "",
        description: "",
        address: "",
        flat_code: '',
        user: nil,
      }
    end

    describe "GET show" do
      it "assigns the requested flat as @flat" do
        flat = Flat.create! valid_attributes
        get :show, params: {:id => flat.to_param}
        expect(assigns(:flat)).to eq(flat)
      end
    end

    describe "GET new" do
      it "assigns a new flat as @flat" do
        get :new, params: {}
        expect(assigns(:flat)).to be_a_new(Flat)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new Flat" do
          expect {
            post :create, params: {:flat => valid_attributes}
          }.to change(Flat, :count).by(1)
        end

        it "assigns a newly created flat as @flat" do
          post :create, params: {:flat => valid_attributes}
          expect(assigns(:flat)).to be_a(Flat)
          expect(assigns(:flat)).to be_persisted
        end

        it "redirects to the created flat" do
          post :create, params: {:flat => valid_attributes}
          expect(response).to redirect_to(Flat.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved flat as @flat" do
          post :create, params: {:flat => invalid_attributes}
          expect(assigns(:flat)).to be_a_new(Flat)
        end

        it "re-renders the 'new' template" do
          post :create, params: {:flat => invalid_attributes}
          expect(response).to render_template("new")
        end
      end
    end
  end

else
  describe "FlatsController" do
    it "should exist" do
      expect(defined?(FlatsController)).to eq(true)
    end
  end
end
