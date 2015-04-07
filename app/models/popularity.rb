class Popularity < ActiveRecord::Base
  belongs_to :url
  belongs_to :word

  validates :occurrences, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :word_id, uniqueness: { scope: :url, message: 'should appear once per url' }

end
