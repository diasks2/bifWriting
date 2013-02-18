class Word < ActiveRecord::Base
  attr_accessible :rank, :word, :lemma, :pos, :pos_long, :english_definition, :frequency, :sum_frequency, :coca_spoken_freq, :coca_fiction_freq, :coca_magazines_freq, :coca_newspapers_freq, :sat, :gre
end
