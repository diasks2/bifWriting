# -*- encoding : utf-8 -*-
class StaticPagesController < ApplicationController

  def home
  	text = "A minute is a unit of measurement of time or of angle. The minute is a unit of time equal to 1/60th of an hour or 60 seconds by 1. In the UTC time scale, a minute occasionally has 59 or 61 seconds; see leap second. The minute is not an SI unit; however, it is accepted for use with SI units. The symbol for minute or minutes is min. The fact that an hour contains 60 minutes is probably due to influences from the Babylonians, who used a base-60 or sexagesimal counting system. Colloquially, a min. may also refer to an indefinite amount of time substantially longer than the standardized length." 
  	tokenizer = Punkt::SentenceTokenizer.new(text)
	#@result = tokenizer.sentences_from_text(text, :output => :tokenized_sentences)
	#@result = tokenizer.sentences_from_text(text)
	#@result = tokenizer.sentences_from_text(text, :output => :sentences_text)

	# Create a parser object
  	tgr = EngTagger.new
  
  	# Sample text
  	text = "A minute is a unit of measurement of time or of angle. The minute is a unit of time equal to 1/60th of an hour or 60 seconds by 1. In the UTC time scale, a minute occasionally has 59 or 61 seconds; see leap second. The minute is not an SI unit; however, it is accepted for use with SI units. The symbol for minute or minutes is min. The fact that an hour contains 60 minutes is probably due to influences from the Babylonians, who used a base-60 or sexagesimal counting system. Colloquially, a min. may also refer to an indefinite amount of time substantially longer than the standardized length." 

  	# Add part-of-speech tags to text
  	@tagged = tgr.add_tags(text)
	#=> "<nnp>Alice</nnp> <vbd>chased</vbd> <det>the</det> <jj>big</jj> <jj>fat</jj><nn>cat</nn> <pp>.</pp>"
  

    @sentences = tgr.get_sentences(text)
  	# Get all nouns from a tagged output
  	@nouns = tgr.get_nouns(@tagged)
  
  	#=> {"cat"=>1, "Alice"=>1}

  	# Get all proper nouns
  	@proper = tgr.get_proper_nouns(@tagged)

  	#=> {"Alice"=>1}
  
  end

end
