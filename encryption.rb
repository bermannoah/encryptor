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
end


# The following are ways of accessing the above classes and methods.

class Application

puts "Enter 1 for encrypting or 2 for decrypting."
puts "To exit the program, enter 3. "

selection = gets.chomp.to_i
if selection == 1
    string = " "
    rotation = " "
      while string != "finished" && rotation != "finished"
          puts "Enter text to be encrypted or type 'finished' to exit > "
            string = gets.chomp.to_s
          puts "Enter rotation number > "
            rotation = gets.chomp.to_i
          e = Encryptor.new
          puts e.encrypt(string, rotation)
        end
          puts "Exiting program...done."
          exit
end

if selection == 2

    string = " "
    rotation = " "

    while string != "finished" && rotation != "finished"
      puts "Enter text to be decrypted or type 'finished' to exit > "
        string = gets.chomp.to_s
      puts "Enter rotation number > "
        rotation = gets.chomp.to_i
        d = Decryptor.new
        puts d.decrypt(string, rotation)
      end
      puts "Exiting program...done."
      exit
end
end
