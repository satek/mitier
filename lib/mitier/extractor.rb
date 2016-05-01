module Mitier
  class Extractor
    attr_accessor :path

    class ModelNotLoaded < Exception; end

    def initialize(path)
      @path = path
    end

    def load
      @extractor = Mitier::Wrapper.mitie_load_named_entity_extractor @path
      self
    end

    def process_ner(text)
      raise ModelNotLoaded unless @extractor
      Ner.new(@extractor, text).process
    end
  end
end
