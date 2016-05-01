module Mitier
  module Wrapper
    extend FFI::Library
    ffi_lib 'mitie'
    attach_function :mitie_tokenize_file, [:string], :pointer
    attach_function :mitie_tokenize, [:string], :pointer
    attach_function :mitie_load_named_entity_extractor, [:string], :pointer
    attach_function :mitie_extract_entities, [:pointer, :pointer], :pointer
    attach_function :mitie_ner_get_num_detections, [:pointer], :ulong
    attach_function :mitie_ner_get_detection_tagstr, [:pointer, :ulong], :string
    attach_function :mitie_ner_get_detection_tag, [:pointer, :ulong], :ulong
    attach_function :mitie_ner_get_detection_score, [:pointer, :ulong], :float
    attach_function :mitie_ner_get_detection_length, [:pointer, :ulong], :ulong
    attach_function :mitie_ner_get_detection_position,
                    [:pointer, :ulong], :ulong
  end
end
