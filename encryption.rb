class Cipher

  attr_reader :characters, :rotated_characters

  def initialize(characters, rotated_characters)
    @characters = characters
    @rotated_characters = rotated_characters
  end

  def rot(rotation)
    characters = (' '..'z').to_a
    rotated_characters = characters.rotate(rotation.to_i)
    Hash[characters.zip(rotated_characters)]
  end
end

class Encryptor < Cipher

  attr_reader :letter, :rotation
  def initialize
    @letter = letter
    @rotation = rotation
  end


  def encrypt_letter(letter, rotation)
    cipher = @rot
    cipher_for_rotation = rot(rotation)
    cipher_for_rotation[letter]
  end

   def encrypt(string, rotation)                  # encrypts a string
     letters = string.split("")
     results = letters.collect do |letter|
     encrypted_letter = encrypt_letter(letter, rotation)
   end
     results.join                     # joins encrypted array as a string
  end

  def encrypt_file(filename, rotation)
      input = File.open(filename, "r")  # opens file
      clear_text = input.read           # reads file into cleartext
      cipher_text = encrypt(clear_text, rotation) # encrypts clear text with rotation parameter
      output = File.open(filename, "w") # creates file for encrypted text
      output.write(cipher_text) # writes cipher text to new file
      output.close   # closes file
  end


end


class Decryptor < Encryptor

      attr_reader :letter, :rotation
      def initialize
        @letter = letter
        @rotation = rotation
      end

      def decrypt(string, rotation)
        x = (0 - rotation).to_i
        letters = string.split("")
        decrypted_results = letters.collect do |letter|
        decrypted_letter = encrypt_letter(letter, x)
      end
        decrypted_results.join            # outputs decrypted string
  end

  def decrypt_file(filename, rotation)
      input = File.open(filename, "r")  # opens file
      code_language = input.read    # reads gibberish
      not_code_language = decrypt(code_language, rotation)  # decrypts gibberish
      what_it_says = File.open(filename, "w") # creates a new file and changes encrypted to decrypted
      what_it_says.write(not_code_language) # writes decrypted info to new file
      what_it_says.close  # closes that file
  end


end
