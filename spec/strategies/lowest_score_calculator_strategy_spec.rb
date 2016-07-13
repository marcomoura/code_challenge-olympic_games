describe LowestScoreCalculatorStrategy do
  context '.compute' do
    context 'when there are multiples athletes' do
      subject { described_class.new.compute input }

      let(:input) do
        [
          double(athlete_code: '1', score: 1), double(athlete_code: '1', score: 2),
          double(athlete_code: '1', score: 3),
          double(athlete_code: '4', score: 4), double(athlete_code: '4', score: 4),
          double(athlete_code: '2', score: 2)
        ]
      end

      let(:athlete_1) { { athlete_code: '1', score: 1 } }
      let(:athlete_2) { { athlete_code: '2', score: 2 } }
      let(:athlete_3) { { athlete_code: '4', score: 4 } }

      it { expect(subject.size).to eq 3 }
      it { expect(subject.first).to have_attributes athlete_1 }
      it { expect(subject.second).to have_attributes athlete_2 }
      it { expect(subject.third).to have_attributes athlete_3 }
    end
  end
end
