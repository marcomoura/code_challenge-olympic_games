describe Sport do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_length_of(:name).is_at_most 50 }
  it do
    expect(described_class.new(name: 'judo'))
      .to validate_uniqueness_of(:name).allow_blank.case_insensitive
  end
  it { is_expected.to define_enum_for(:comparison_operator).with %i(greater lesser) }
end
