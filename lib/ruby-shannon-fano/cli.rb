require 'ruby-shannon-fano'

module RubyShannonFano
  class CLI
    include RubyShannonFano

    def run(_args = [])
      pp 'Write text'
      text = gets.chomp
      # text = 'красная краска'
      char_hash, code_hash = build_cod_array(sort_hash(get_count_hash(text)))
      pp 'Char hash'
      pp char_hash
      pp 'Encode text:'
      pp encode_text = encode(text, char_hash)
      pp 'Decode text'
      pp decode(encode_text, code_hash)
      pp 'Broke central bit'
      encode_text[encode_text.length / 2] = encode_text[encode_text.length / 2] == '1' ? '0' : '1'
      pp decode(encode_text, code_hash)
    end
  end
end
