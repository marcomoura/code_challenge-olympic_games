describe CompetitionsController do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/competitions')
        .to route_to 'competitions#create', format: :json
    end

    it 'routes to #delete' do
      expect(delete: '/competitions/1')
        .to route_to 'competitions#destroy', id: '1', format: :json
    end

    it 'routes to #show' do
      expect(get: '/competitions/1')
        .to route_to 'competitions#show', id: '1', format: :json
    end

    it 'routes to #update via PUT' do
      expect(put: '/competitions/1')
        .to route_to 'competitions#update', id: '1', format: :json
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/competitions/1')
        .to route_to 'competitions#update', id: '1', format: :json
    end
  end
end
