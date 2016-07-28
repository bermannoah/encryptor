class Encryptor
  def cipher(rotation)                            # letter hash for ROT-13 cipher
    characters = (' '..'z').to_a
    rotated_characters = characters.rotate(rotation)
    Hash[characters.zip(rotated_characters)]
   end

   def encrypt_letter(letter, rotation)
     cipher_for_rotation = cipher(rotation)
     cipher_for_rotation[letter]
   end

   def encrypt(string, rotation)                  # encrypts a string
     letters = string.split("")
     results = letters.collect do |letter|
       encrypted_letter = encrypt_letter(letter, rotation)
   end
     results.join                     # joins encrypted array as a string
end

  def decrypt(string, rotation)                 # decrypts an encrypted string using encrypt
    x = (0 - rotation).to_i
    letters = string.split("")
    decrypted_results = letters.collect do |letter|
      decrypted_letter = encrypt_letter(letter, x)
    end
    decrypted_results.join            # outputs decrypted string
end
    def encrypt_file(filename, rotation)
      input = File.open(filename, "r")  # opens file
      clear_text = input.read           # reads file into cleartext
      cipher_text = encrypt(clear_text, rotation) # encrypts clear text with rotation parameter
      output = File.open(filename + ".encrypted", "w") # creates file for encrypted text
      output.write(cipher_text) # writes cipher text to new file
      output.close   # closes file
end
end
