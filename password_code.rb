require_relative 'encryption'

class Passwords

  password = File.open("encryptor_password.rb", "r")
  password.read


    if File.zero?(password)         # checks to see if the password file is empty
      puts "Add a password to use this application > "
        password_new = gets.chomp                  # asks for and then encrypts a new password
          security = File.open("encryptor_password.rb", "w")
          security.write(password_new)
          security.close
          e = Encryptor.new
          e.encrypt_file("encryptor_password.rb", 4096)
          puts "Password accepted. Please restart."
        exit
    else                                          # if there IS a password, use this to access encrypt/decrypt
      puts "Enter password to login > "
        login = gets.chomp
          check_pass = File.open("check_pass.rb", "w")
          check_pass.write(login)
          check_pass.close
          e = Encryptor.new
          e.encrypt_file("check_pass.rb", 4096).to_s

            checker = File.open("check_pass.rb", "r")           # checks to see if password entered matches existing pw
            original = File.open("encryptor_password.rb", "r")
            p1 = checker.read.to_s
            p2 = original.read.to_s

            if p1 == p2
              def initialize
                @application = Application.new
              end
            end

            if p1 != p2
              puts "Incorrect password entry. Try again." # error message if a bad pw is entered.
              exit

            end
          end
        end
