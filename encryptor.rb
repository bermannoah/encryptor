require_relative 'encryption'           # loads encryption code as separate file
require_relative 'password_code'

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

              if string == "finished"
                puts "Exiting program...done."
                exit
              end

            puts "Enter rotation number > "
              rotation = gets.chomp.to_i
            e = Encryptor.new
            puts e.encrypt(string, rotation)
          end
            puts "Exiting program...done."
            exit


  elsif selection == 2

      string = " "
      rotation = " "

      while string != "finished" && rotation != "finished"
        puts "Enter text to be decrypted or type 'finished' to exit > "
          string = gets.chomp.to_s

          if string == "finished"
            puts "Exiting program...done."
            exit
          end

        puts "Enter rotation number > "
          rotation = gets.chomp.to_i
          d = Decryptor.new
          puts d.decrypt(string, rotation)
        end
        puts "Exiting program...done."
        exit

  elsif selection == 3
    puts "Exiting program...done."
    exit

  else
    puts "Incorrect option entered. Please try again."
    exit
  end
end
