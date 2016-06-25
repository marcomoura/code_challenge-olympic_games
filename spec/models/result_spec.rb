describe Result do
  it { is_expected.to belong_to(:athlete).with_foreign_key('athlete_code').with_primary_key 'code' }
  it { is_expected.to validate_presence_of :athlete }
  it { is_expected.to validate_numericality_of(:score).only_integer }
end
