describe Competition do
  it { is_expected.to belong_to :sport }
  it { is_expected.to validate_presence_of :sport_name }

  it { is_expected.to validate_presence_of :athletes }
  it { is_expected.to accept_nested_attributes_for :athletes }
  it { is_expected.to have_many :athletes }
end
