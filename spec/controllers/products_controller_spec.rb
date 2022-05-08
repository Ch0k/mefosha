require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  #let(:question) { create(:question, user: user) } 

  describe 'GET #index' do
    let(:products) { create_list(:product,3) } 
    before { get :index }

    it 'populates an array of all question' do 
      expect(assigns(:products)).to match_array(products)
    end 
    
    it 'renders index view' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    let(:product) { create(:product) } 
    before { get :show, params: { id: product } }

    it 'assing the requested question to @question' do 
      expect(assigns(:product)).to eq product
    end 
    it 'renders show view' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    before { get :new }
    
    it 'assing the new Question to @question' do 
      expect(assigns(:product)).to be_a_new(Product)
    end 

    it 'renders new view' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    let(:product) { create(:product) } 
    before { get :edit, params: { id: product } }

    it 'assing the requested question to @question' do 
      expect(assigns(:product)).to eq product
    end
     
    it 'renders edit view' do
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context 'with valide attributes' do

      it 'create object in database' do 
        expect { post :create, params: {product: attributes_for(:product)} }.to change(Product,:count).by(1)
      end
      it 'redirect in show view' do 
        post :create, params: {product: attributes_for(:product)} 
        expect(response).to redirect_to assigns(:product)
      end
    end

    context 'with invalide attributes' do
      it 'does not save question' do
        expect { post :create, params: {product: attributes_for(:product, :invalid)} }.to_not change(Product,:count)
      end

      it 're render new view' do
        post :create, params: {product: attributes_for(:product,:invalid)} 
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
  
    describe 'Author of question' do
      context 'with valide attributes' do
        let(:product) { create(:product) } 

        it 'assing the requested question to @question' do 
          patch :update, params: { id: product, product: attributes_for(:product)}
          expect(assigns(:product)).to eq product
        end 

        it 'change question attribute' do 
          patch :update, params: { id: product, product: {title: 'new title', description: 'new body'}}
          product.reload
          expect(product.title).to eq 'new title'
          expect(product.description).to eq 'new body'
        end

        it 'redirect to update question' do 
          patch :update, params: { id: product, product: attributes_for(:product)}
          expect(response).to redirect_to product
        end

      end

      context 'with invalide attributes' do
        let(:product) { create(:product) }

        before { patch :update, params: { id: product, product: attributes_for(:product, :invalid)} }
        it 'does not checnge question' do
          product.reload
          expect(product.title).to eq 'MyString'
          expect(product.description).to eq 'MyText'
        end

        it 're render edit view' do
          expect(response).to render_template :edit
        end
      end
    end
  end

  describe 'DELETE #destroy' do
  
    context "user is author of question" do
      let!(:product) { create(:product) } 
      
      it 'destroy question in database' do
        expect{ delete :destroy, params: { id: product } }.to change(Product, :count).by(-1)
      end
  
      it 'redirect to index' do
        delete :destroy, params: { id: product}
        expect(response).to redirect_to products_path
      end
    end
  end
end
