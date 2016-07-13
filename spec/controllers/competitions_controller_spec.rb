describe CompetitionsController do
  describe 'GET #show' do
    context 'success' do
      before do
        allow(CompetitionFacade).to receive(:ranking).and_return 1
        get :show, id: 1, format: :json
      end

      it { expect(response).to have_http_status 200 }
    end

    context 'error' do
      before do
        allow(CompetitionFacade).to receive(:ranking).and_raise ActiveRecord::RecordNotFound
        get :show, id: 1, format: :json
      end

      it { expect(response).to have_http_status 404 }
    end
  end

  describe 'POST #create' do
    context 'success' do
      before do
        allow(CompetitionFacade).to receive(:create).and_return 'fake'
        post :create, competition: { sport: 1 }, format: :json
      end

      it { expect(response).to have_http_status 201 }
      it { expect(assigns(:competition)).to eq 'fake' }
    end

    context 'error' do
      before do
        allow(CompetitionFacade)
          .to receive(:create)
          .and_raise ActiveRecord::RecordInvalid.new(Competition.new)
        post :create, sport: 1, format: :json
      end

      it { expect(response).to have_http_status 400 }
    end
  end

  describe 'DELETE #destroy' do
    context 'success' do
      before do
        allow(CompetitionFacade).to receive(:finish).and_return true
        delete :destroy, id: 1
      end

      it { expect(response).to have_http_status 200 }
    end

    context 'error' do
      before do
        allow(CompetitionFacade).to receive(:finish).and_raise ActiveRecord::RecordNotFound
        delete :destroy, id: 1
      end

      it { expect(response).to have_http_status 404 }
    end
  end
end
