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
      output = File.open(filename, "w") # creates file for encrypted text
      output.write(cipher_text) # writes cipher text to new file
      output.close   # closes file
  end

  def decrypt_file(filename, rotation)
      input = File.open(filename, "r")  # opens file
      code_language = input.read    # reads gibberish
      not_code_language = decrypt(code_language, rotation)  # decrypts gibberish
      what_it_says = File.open(filename, "w") # creates a new file and changes encrypted to decrypted
      what_it_says.write(not_code_language) # writes decrypted info to new file
      what_it_says.close  # closes that file
    end

  def supported_characters
    (' '..'z').to_a
  end

  def crack(message)
    supported_characters.count.times.collect do |attempt|
      decrypt(message, attempt)
    end
  end

password = File.open("encryptor_password.rb", "r")
password.read


  if File.zero?("encryptor_password.rb")         # checks to see if the password file is empty
    puts "Add a password to use this application > "
      password_new = gets.chomp
        security = File.open("encryptor_password.rb", "w")
        security.write(password_new)
        security.close
        e = Encryptor.new
        e.encrypt_file("encryptor_password.rb", 2048)
  else
    puts "Enter password to login > "
      login = gets.chomp
        check_pass = File.open("check_pass.rb", "w")
        check_pass.write(login)
        check_pass.close
        e = Encryptor.new
        e.encrypt_file("check_pass.rb", 2048).to_s

          checker = File.open("check_pass.rb", "r")
          original = File.open("encryptor_password.rb", "r")
          p1 = checker.read.to_s
          p2 = original.read.to_s
          if p1 == p2
            check_pass.write("")
            puts "Enter 1 to encrypt or 2 to decrypt."          # code to make the program more user friendly
              selection = gets.chomp.to_i

              if selection == 1
                puts "Enter text to be encrypted > "
                  string = gets.chomp
                puts "Enter rotation number > "
                  rotation = gets.chomp.to_i
                e = Encryptor.new
                puts e.encrypt(string, rotation)
              elsif selection == 2
                puts "Enter text to be decrypted > "
                  string = gets.chomp
                puts "Enter rotation number > "
                  rotation = gets.chomp.to_i
                e = Encryptor.new
                puts e.decrypt(string, rotation)
              else
                puts "Please enter 1 or 2."
            end
          else
            puts "Your password was entered incorrectly. Try again."
          end
        end
      end
