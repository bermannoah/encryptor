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
