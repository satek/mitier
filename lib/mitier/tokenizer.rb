module Mitier
  class Tokenizer
    attr_accessor :tokens, :text

    def initialize(text)
      @text = text.to_s.strip
    end

    def process
      return [] if text.empty?
      tokens_ptr = tokenize
      process_token_elements tokens_ptr
    end

    private

    def tokenize
      Wrapper.mitie_tokenize text
    end

    def process_token_elements(ptr)
      @tokens = [].tap do |elements|
        until (element = ptr.read_pointer).null?
          elements << element.read_string
          ptr += FFI::Type::POINTER.size
        end
      end
    end
  end
end
