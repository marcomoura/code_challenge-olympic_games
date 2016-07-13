class UpdateAttributesAdapter
  def self.adapt(id, attributes)
    new(id, attributes).params
  end

  def initialize(id, attributes)
    @competition = id
    @attributes = attributes['results']
  end

  def params
    { athletes_attributes: attributes }
  end

  private

  def attributes
    to_hash athletes_attributes
  end

  def athletes_attributes
    @attributes.collect do |item|
      { id: athlete_id(item['athlete_code']),
        results_attributes: results_attributes(item['score']) }
    end
  end

  def results_attributes(score)
    { 0 => { score: score } }
  end

  def athlete_id(code)
    Athlete.find_by_code_and_competition_id!(code, @competition).id
  rescue ActiveRecord::RecordNotFound
    raise AthleteNotFoundError
  end

  def to_hash(attrs)
    attrs.map.with_index { |a, i| [i, a] }.to_h
  end
end
