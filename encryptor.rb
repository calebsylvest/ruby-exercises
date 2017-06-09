class Encryptor

  # def cipher
  #   {'a' => 'n', 'b' => 'o', 'c' => 'p', 'd' => 'q',
  #    'e' => 'r', 'f' => 's', 'g' => 't', 'h' => 'u',
  #    'i' => 'v', 'j' => 'w', 'k' => 'x', 'l' => 'y',
  #    'm' => 'z', 'n' => 'a', 'o' => 'b', 'p' => 'c',
  #    'q' => 'd', 'r' => 'e', 's' => 'f', 't' => 'g',
  #    'u' => 'h', 'v' => 'i', 'w' => 'j', 'x' => 'k',
  #    'y' => 'l', 'z' => 'm'}
  # end

  def cipher(rotation)
    characters = (' '..'z').to_a
    rotated_characters = characters.rotate(rotation)
    Hash[characters.zip(rotated_characters)]
  end

  def encrypt_letter(letter, rotation)
    cipher_for_rotation = cipher(rotation)
    cipher_for_rotation[letter]
  end

  def encrypt(string, rotation)
    letters = string.split("")
    results = letters.collect do |letter|
      encrypted_letter = encrypt_letter(letter, rotation)
    end
    results.join
  end

  def decrypt(string, rotation)
    rotation = -rotation
    results = encrypt(string, rotation)
  end

  def encrypt_file(filename, rotation)
    # 1. Create the file handle to the input file
    input = File.open(filename, "r")
    # 2. Read the text of the input file
    text = input.read
    # 3. Encrypt the text
    encrypted_text = encrypt(text, rotation)
    # 4. Create a name for the output file
    output_filename = filename + ".encrypted"
    # 5. Create an output file handle
    output = File.open(output_filename, "w")
    # 6. Write out the text
    output.write(encrypted_text)
    # 7. Close the file
    output.close
  end

  def decrypt_file(filename, rotation)
    # 1. Create the file handle to the encrypted file
    input = File.open(filename, "r")
    # 2. Read the encrypted text
    text = input.read
    # 3. Decrypt the text by passing in the text and rotation
    decrypted_text = decrypt(text, rotation)
    # 4. Create an name for the decrypted file
    output_filename = filename.gsub("encrypted", "decrypted")
    # 5. Create an output file handle
    output = File.open(output_filename, "w")
    # 6. Write out the text
    output.write(decrypted_text)
    # 7. Close the file
    output.close
  end

  def supported_characters
    (' '..'z').to_a
  end

  def crack(message)
    supported_characters.count.times.collect do |attempt|
      decrypt(message, attempt)
    end
  end
end
