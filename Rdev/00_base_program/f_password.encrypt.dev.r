


#@2. Combining SHA-256 and AES-CBC: Encrypting and Decrypting Passwords ----
library(openssl)

encrypt_password <- function(password, passphrase) {
  # Generate a key using SHA-256
  key <- sha256(charToRaw(passphrase))
  # Encrypt the password using AES-CBC
  iv <- random_bytes(16)  # Initialization vector
  encrypted <- aes_cbc_encrypt(charToRaw(password), key, iv = iv)
  # Combine IV and encrypted password for storage
  combined <- c(iv, encrypted)
  # Encode combined result in base64 for easy storage
  encoded <- base64_encode(combined)
  return(encoded)
}

decrypt_password <- function(encoded_password, passphrase) {
  # Decode the base64 encoded password
  combined <- base64_decode(encoded_password)
  # Extract IV and encrypted password
  iv <- combined[1:16]
  encrypted <- combined[-(1:16)]
  # Generate the same key using SHA-256
  key <- sha256(charToRaw(passphrase))
  # Decrypt the password using AES-CBC
  decrypted <- aes_cbc_decrypt(encrypted, key, iv = iv)
  # Convert raw to character
  password <- rawToChar(decrypted)
  return(password)
}

# Define the passphrase (this should be securely stored or hardcoded in a secure manner)
passphrase <- "your_secret_passphrase"

# Encrypt the password (this step should be done once and the result stored in the script)
original_password <- "your_password"
encrypted_password <- encrypt_password(original_password, passphrase)
cat("Encrypted password: ", encrypted_password, "\n")

# Decrypt the password (use this whenever you need the password)
retrieved_password <- decrypt_password(encrypted_password, passphrase)
cat("Decrypted password: ", retrieved_password, "\n")

