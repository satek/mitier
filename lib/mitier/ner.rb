module Mitier
  class Ner < Tokenizer
    attr_accessor :detections

    def initialize(extractor, text)
      super text
      @extractor = extractor
    end

    def process
      check_text { return self }
      tokens_ptr = tokenize
      detections_ptr = detect tokens_ptr
      process_token_elements tokens_ptr
      process_detections detections_ptr
      self
    end

    private

    attr_accessor :extractor

    def detect(tokens_ptr)
      Wrapper.mitie_extract_entities extractor, tokens_ptr
    end

    def process_detections(ptr)
      num = Wrapper.mitie_ner_get_num_detections ptr
      @detections = (0...num).map { |elem| detection_attrs(ptr, elem) }
    end

    def detection_attrs(ptr, nr)
      { tokens: detection_tokens(ptr, nr),
        tagstr: Wrapper.mitie_ner_get_detection_tagstr(ptr, nr),
        tag: Wrapper.mitie_ner_get_detection_tag(ptr, nr),
        score: Wrapper.mitie_ner_get_detection_score(ptr, nr) }
    end

    def detection_tokens(ptr, nr)
      pos = Wrapper.mitie_ner_get_detection_position ptr, nr
      len = Wrapper.mitie_ner_get_detection_length ptr, nr
      (pos...(pos + len)).map { |elem| tokens[elem] }
    end

    def check_text
      return unless text.empty?
      @tokens = @detections = []
      yield
    end
  end
end
