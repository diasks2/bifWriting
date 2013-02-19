# -*- encoding : utf-8 -*-
module PassagesHelper
  def pos_convert(pos)
	case pos
  	  when "cc"
  	    return "conjunction"
  	  when "det", "pdt", "prp", "prps", "wdt", "wps"
  	  	return "determiner"
  	  when "ex"
  	  	return "existential there"
  	  when "fw"
  	  	return "foreign words"		
  	  when "pp", "ppc", "ppd", "ppl", "ppr", "pps", "lrb", "rrb"
  	  	return "punctuation"
      when "vb", "vbd", "vbg", "vbn", "vbp", "vbz", "md"
      	return "verb"
   	  when "rb", "rbr", "rbs", "rp", "wrb"
   	  	return "adverb"
  	  when "nn", "nnp", "nnps", "nns"
  	    return "noun"
      when "jj", "jjr", "jjs"
        return "adjective" 
      when "wp"
    	return "pronoun"
   	  when "sym", "ls"
   	    return "symbol"
   	  when "uh"
   	  	return "interjection" 
   	  when "pos"
   	  	return "possessive"
   	  when "in", "to"
   	  	return "preposition"
   	  when "cd"
   	  	return "number"
   	  else
   	  	return pos	
	end
  end
end  
