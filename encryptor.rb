class Encryptor
  def cipher                            # letter hash for ROT-13 cipher
    {'a' => 'n', 'b' => 'o', 'c' => 'p', 'd' => 'q',
     'e' => 'r', 'f' => 's', 'g' => 't', 'h' => 'u',
     'i' => 'v', 'j' => 'w', 'k' => 'x', 'l' => 'y',
     'm' => 'z', 'n' => 'a', 'o' => 'b', 'p' => 'c',
     'q' => 'd', 'r' => 'e', 's' => 'f', 't' => 'g',
     'u' => 'h', 'v' => 'i', 'w' => 'j', 'x' => 'k',
     'y' => 'l', 'z' => 'm'}
   end

   def encrypt_letter(letter)           # just encrypts one letter
     lowercase_letter = letter.downcase
     cipher[lowercase_letter]
   end

   def encrypt(string)                  # encrypts a string
     letters = string.split("")
     results = letters.collect do |letter|
       encrypted_letter = encrypt_letter(letter)
   end
     results.join                     # joins encrypted array as a string
end
end
