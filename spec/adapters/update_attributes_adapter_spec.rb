describe UpdateAttributesAdapter do
  context '#adapt' do
    let(:id) { '1' }
    let(:input) do
      {
        'results' => [
          { 'athlete_code' => '111', 'score' => '111111' },
          { 'athlete_code' => '222', 'score' => '222222' }
        ]
      }
    end

    let(:output) do
      {
        athletes_attributes: {
          0 => {
            id: 1,
            results_attributes: { 0 => { score: '111111' } }
          },
          1 => {
            id: 2,
            results_attributes: { 0 => { score: '222222' } }
          }
        }
      }
    end

    before do
      allow(Athlete)
        .to receive(:find_by_code_and_competition_id!)
        .and_return(double(id: 1), double(id: 2))
    end

    subject { described_class.adapt id, input }
    it { is_expected.to eq output }
  end
end
