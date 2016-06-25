describe Athlete do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_length_of(:name).is_at_most 50 }
  it { is_expected.to validate_presence_of :code }
  it { is_expected.to validate_length_of(:code).is_at_most 50 }
  it { is_expected.to validate_presence_of :competition }
end
