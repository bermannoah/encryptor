class Encryptor
  def cipher(rotation)                            # letter hash for ROT-13 cipher
    characters = (' '..'z').to_a
    rotated_characters = characters.rotate(rotation)
    Hash[characters.zip(rotated_characters)]
   end

   def encrypt_letter(letter,rotation)
     cipher_for_rotation = cipher(rotation)
     cipher_for_rotation[letter]
   end

   def encrypt(string,rotation)                  # encrypts a string
     letters = string.split("")
     results = letters.collect do |letter|
       encrypted_letter = encrypt_letter(letter,rotation)
   end
     results.join                     # joins encrypted array as a string
end

  def decrypt(string)                 # decrypts an encrypted string using encrypt
    letters = string.split("")
    decrypted_results = letters.collect do |letter|
      decrypted_letter = encrypt_letter(letter)
    end
    decrypted_results.join            # outputs decrypted string
end

end
