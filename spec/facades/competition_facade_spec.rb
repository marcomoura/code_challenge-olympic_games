describe CompetitionFacade do
  context '#create' do
    let(:attributes) do
      {
        'sport' => 'running',
        'athletes' => [{ 'name' => 'xyz', 'code' => '171' }]
      }
    end

    it { expect { described_class.create(attributes) }.to change { Competition.count }.by 1 }
    it { expect(described_class.create(attributes)).to be_kind_of Competition }
  end

  context '#add_result' do
    let(:id) { 1 }
    let(:attributes) do
      { 'results' => [{ 'athlete_code' => '9', 'score' => '273090' }] }
    end

    before do
      described_class.create 'sport' => 'running', 'athletes' => [{ name: 'x', code: '9' }]
    end

    it { expect { described_class.add_result(id, attributes) }.to change { Result.count }.by 1 }
    it { expect(described_class.add_result(id, attributes)).to be_truthy }
  end
end
