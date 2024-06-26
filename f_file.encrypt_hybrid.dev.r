# https://chatgpt.com/c/e4dd764c-8bd1-4243-947c-862b2fe638ff
# f_file.encrypt_hybrid.dev.r
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  

# Define a function to perform XOR encryption
xor_encrypt <- function(data, password) {
  data_raw <- serialize(data, NULL)
  password_raw <- charToRaw(password)
  
  # Repeat the password to match the length of the data
  password_repeated <- rep(password_raw, length.out = length(data_raw))
  
  # Perform XOR encryption
  encrypted_raw <- xor(as.raw(data_raw), as.raw(password_repeated))
  
  return(encrypted_raw)
}

# Load your dataset
dataset <- read.csv("path/to/your/dataset.csv")

# Encrypt the dataset
password <- "your_password"
encrypted_dataset <- xor_encrypt(dataset, password)

# Save the encrypted dataset to a file
writeBin(encrypted_dataset, "path/to/your/encrypted_dataset.bin")

#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
# Define a function to perform XOR decryption (same as encryption for XOR)
xor_decrypt <- function(encrypted_data, password) {
  password_raw <- charToRaw(password)
  
  # Repeat the password to match the length of the encrypted data
  password_repeated <- rep(password_raw, length.out = length(encrypted_data))
  
  # Perform XOR decryption
  decrypted_raw <- xor(encrypted_data, as.raw(password_repeated))
  
  # Deserialize the raw vector back to an R object
  data <- unserialize(decrypted_raw)
  
  return(data)
}

# Load the encrypted dataset
encrypted_dataset <- readBin("path/to/your/encrypted_dataset.bin", what = "raw", n = file.info("path/to/your/encrypted_dataset.bin")$size)

# Decrypt the dataset
password <- "your_password"
decrypted_dataset <- xor_decrypt(encrypted_dataset, password)

# Now you can use the decrypted dataset
print(decrypted_dataset)



#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
library(openssl)
library(readr)

# Define a function to encrypt the data using AES-CBC
encrypt_data <- function(data, password) {
  # Serialize the dataset to a raw vector
  data_raw <- serialize(data, NULL)
  
  # Generate a key and IV (Initialization Vector) from the password
  key <- sha256(charToRaw(password))
  iv <- rand_bytes(16)
  
  # Encrypt the serialized data
  encrypted_data <- aes_cbc_encrypt(data_raw, key = key, iv = iv)
  
  return(list(encrypted_data = encrypted_data, iv = iv))
}

# Prompt user to enter the password
password <- readline(prompt = "Enter encryption password: ")

# Load your dataset
dataset <- read_csv("path/to/your/dataset.csv")

# Encrypt the dataset
encrypted_result <- encrypt_data(dataset, password)
encrypted_data <- encrypted_result$encrypted_data
iv <- encrypted_result$iv

# Save the encrypted dataset and IV to files
writeBin(encrypted_data, "path/to/your/encrypted_dataset.bin")
writeBin(iv, "path/to/your/iv.bin")

#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
library(openssl)

# Define a function to decrypt the data using AES-CBC
decrypt_data <- function(encrypted_data, iv, password) {
  # Generate a key from the password
  key <- sha256(charToRaw(password))
  
  # Decrypt the data
  decrypted_data_raw <- aes_cbc_decrypt(encrypted_data, key = key, iv = iv)
  
  # Deserialize the raw vector back to an R object
  data <- unserialize(decrypted_data_raw)
  
  return(data)
}

# Prompt user to enter the password
password <- readline(prompt = "Enter decryption password: ")

# Load the encrypted dataset and IV
encrypted_dataset <- readBin("path/to/your/encrypted_dataset.bin", what = "raw", n = file.info("path/to/your/encrypted_dataset.bin")$size)
iv <- readBin("path/to/your/iv.bin", what = "raw", n = 16)

# Decrypt the dataset
decrypted_dataset <- decrypt_data(encrypted_dataset, iv, password)

# Now you can use the decrypted dataset
print(decrypted_dataset)


#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  

library(openssl)
library(readr)

# Function to encrypt data using hybrid encryption
encrypt_data_hybrid <- function(data, public_key) {
  # Serialize the dataset to a raw vector
  data_raw <- serialize(data, NULL)
  
  # Generate a random symmetric key (AES)
  symmetric_key <- rand_bytes(32) # 256-bit key
  
  # Encrypt the dataset using the symmetric key
  iv <- rand_bytes(16)
  encrypted_data <- aes_cbc_encrypt(data_raw, key = symmetric_key, iv = iv)
  
  # Encrypt the symmetric key using the public key
  encrypted_symmetric_key <- rsa_encrypt(symmetric_key, public_key)
  
  return(list(encrypted_data = encrypted_data, encrypted_symmetric_key = encrypted_symmetric_key, iv = iv))
}

# Load your dataset
dataset <- read_csv("path/to/your/dataset.csv")

# Load the recipient's public key
public_key_path <- "~/.ssh/id_ed25519.pub"
public_key <- read_pubkey(public_key_path)

# Encrypt the dataset using hybrid encryption
encrypted_result <- encrypt_data_hybrid(dataset, public_key)
encrypted_data <- encrypted_result$encrypted_data
encrypted_symmetric_key <- encrypted_result$encrypted_symmetric_key
iv <- encrypted_result$iv

# Save the encrypted dataset, encrypted symmetric key, and IV to files
writeBin(encrypted_data, "path/to/your/encrypted_dataset.bin")
writeBin(encrypted_symmetric_key, "path/to/your/encrypted_symmetric_key.bin")
writeBin(iv, "path/to/your/iv.bin")



#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  

# Function to decrypt data using hybrid encryption
decrypt_data_hybrid <- function(encrypted_data, encrypted_symmetric_key, iv, private_key) {
  # Decrypt the symmetric key using the private key
  symmetric_key <- rsa_decrypt(encrypted_symmetric_key, private_key)
  
  # Decrypt the dataset using the symmetric key
  decrypted_data_raw <- aes_cbc_decrypt(encrypted_data, key = symmetric_key, iv = iv)
  
  # Deserialize the raw vector back to an R object
  data <- unserialize(decrypted_data_raw)
  
  return(data)
}

# Load the encrypted dataset, encrypted symmetric key, and IV
encrypted_dataset <- readBin("path/to/your/encrypted_dataset.bin", what = "raw", n = file.info("path/to/your/encrypted_dataset.bin")$size)
encrypted_symmetric_key <- readBin("path/to/your/encrypted_symmetric_key.bin", what = "raw", n = file.info("path/to/your/encrypted_symmetric_key.bin")$size)
iv <- readBin("path/to/your/iv.bin", what = "raw", n = 16)

# Load the private key
private_key_path <- "~/.ssh/id_ed25519"
private_key <- read_key(private_key_path)

# Decrypt the dataset using hybrid decryption
decrypted_dataset <- decrypt_data_hybrid(encrypted_dataset, encrypted_symmetric_key, iv, private_key)

# Now you can use the decrypted dataset
print(decrypted_dataset)


#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ END -----  
# paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$CurrentSource.path.filename.ext) |> paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$CurrentSource.path.filename.ext) |> paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="',.,'"') |> paste0("'",.,"' |> system(intern=TRUE)") |> cat("\n")
# paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$CurrentSource.path.filename.ext) |> paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$CurrentSource.path.filename.ext) |> paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="',.,'"') |> paste0("'",.,"' |> system(intern=TRUE)") |> cat("\n")
cat("* To revert to the last commited file, run the following terminal command:\n", 
    '"git checkout -- ',rstudioapi::getSourceEditorContext()$path,'" |> system(intern=TRUE)',"\n", sep="")
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|
