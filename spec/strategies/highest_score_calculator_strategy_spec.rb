describe HighestScoreCalculatorStrategy do
  context '.compute' do
    subject { described_class.new.compute input }

    let(:input) do
      [double(athlete_code: '4', score: 1),
       double(athlete_code: '4', score: 3),
       double(athlete_code: '4', score: 2)]
    end

    let(:athlete_1) { { athlete_code: '4', score: 3 } }

    it { expect(subject.size).to eq 1 }
    it { expect(subject.first).to have_attributes athlete_1 }
  end
end
