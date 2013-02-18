class PassagesController < ApplicationController
  include PassagesHelper
  def new
    @passage = Passage.new
  end

  def create
    @passage = Passage.new(params[:passage])
    if @passage.save
      redirect_to @passage
    else
      render :new
    end
  end

  def edit
    @passage = Passage.find(params[:id])
  end

  def update
    @passage = Passage.find(params[:id])
    if @passage.update_attributes(params[:passage])
      redirect_to @passage
    else
      render 'edit'
    end
  end

  def show
    @passage = Passage.find(params[:id])
    tokenizer = Punkt::SentenceTokenizer.new(@passage.passage)
    tgr = EngTagger.new
    # - Student time to produce a given writing passage
    # - Number of paragraphs
    # - Number of sentences
    # - Number of words
    # - Number of characters
    # - Average length of sentence (# of words)
    # - Average length of a paragraph (# of sentences)
    # - Frequency (using our corpus) of words used in the passage
    # - Originality score (compare words used to other users)
    # - Number of repeated words in the passage
    # - POS breakdown - number of nouns, verbs, etc.

    # - Number of sentences
    @num_sentences_punkt = tokenizer.sentences_from_text(@passage.passage, :output => :tokenized_sentences).length
    @num_sentences_tagger = tgr.get_sentences(@passage.passage).length


    tagged_hash = tgr.add_tags_hash(@passage.passage)

    # - Number of words
    @num_words_tagger = tagged_hash.length
    @num_words_punkt = tokenizer.sentences_from_text(@passage.passage, :output => :tokenized_sentences).flatten!.length

    @tagged_hash = tagged_hash.each { |k, v| tagged_hash[k] = pos_convert(v) }
   
    # words = 314 (pages)
    # words = 312 (word)
    # words = 317 (word count tool)
    # words = 319 (wordcounter.net)
    # words = 320 (word count tool)
    # words = 313
    # sentences = 14
    # avg sentence length = 23
    # paragraphs = 8
    # characters (with spaces) = 1887
    # characters (without spaces) = 1582


    @freq_array = @tagged_hash.inject({}) { |h, (k, v)| h[k] = Word.where('word = ?', k).where("pos_long = ?", v).sum("frequency"); h }


    # Get all nouns from a tagged output
    @nouns = tgr.get_nouns(@tagged)
  
    #=> {"cat"=>1, "Alice"=>1}

    # Get all proper nouns
    @proper = tgr.get_proper_nouns(@tagged)

    #=> {"Alice"=>1}
  


  end

  def index
    @passages = Passage.order("id").all
  end

  def destroy
    @passage = Passage.find(params[:id])
    @passage.destroy
      redirect_to passages_path
  end

end
