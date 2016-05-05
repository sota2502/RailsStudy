require 'rails_helper'

RSpec.describe MythreadsController, type: :controller do
  describe 'GET #index' do
    context 'Not authenticataed' do
      before { get :index }

      it 'redirect to top' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'Authenticataed' do
      login_user

      before do
        get :index
      end

      it 'return 200 status' do
        expect(response.status).to eq 200
      end
    end
  end

  describe 'GET #new' do
    context 'Authenticataed' do
      login_user

      before do
        get :new
      end

      it 'return 200 status' do
        expect(response.status).to eq 200
      end
    end
  end

  describe 'POST #create' do
    context 'Authenticataed' do
      login_user

      before do
        post :create, mythread: {title: "test title", body: "test body"}
      end

      it 'redirect to show' do
        expect(response.status).to eq 302
      end
    end
  end
end
