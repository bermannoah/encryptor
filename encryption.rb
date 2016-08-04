class Cipher

  def cipher(rotation)
    characters = (' '..'z').to_a
    rotated_characters = characters.rotate(rotation)
    Hash[characters.zip(rotated_characters)]
  end

end

class Encryptor

   def encrypt_letter(letter, rotation)
     c = Cipher.new
     cipher_for_rotation = c(rotation)
     cipher_for_rotation[letter]
   end

   def encrypt(string, rotation)                  # encrypts a string
     letters = string.split("")
     c = Cipher.new
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

class Decryptor

  def decrypt(string, rotation)                 # decrypts an encrypted string using encrypt

    c = Cipher.new
    e = Encryptor.new

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


# The following are easily-used ways of accessing the above classes and methods.

puts "Enter 1 for encrypting or 2 for decrypting."
puts "To exit the program, type 'finished'. "

  class Encrypting

    e = Encryptor.new
    string = ""

    until string == "finished"
      puts "Enter text to be encrypted or type 'finished' to exit > "
        string = gets.chomp.to_s
      puts "Enter rotation number > "
        rotation = gets.chomp.to_i
      result = puts e.encrypt(string, rotation)
      puts result
    end



  class Decrypting

    d = Decryptor.new
    string = ""

    until string == "finished"
      puts "Enter text to be decrypted or type 'finished' to exit > "
        string = gets.chomp.to_s
      puts "Enter rotation number > "
        rotation = gets.chomp.to_i
        decrypt_result = puts d.decrypt(string, rotation)
        puts decrypt_result
    end

  end

  selection = gets.chomp.to_i

  if selection == 1
    puts Encrypting.new
  elsif selection == 2
    puts Decrypting.new
  else
    "Exiting...done."
  end
end
