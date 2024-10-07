import requests

# Create a folder named `images` in the current directory to store the downloaded images
if not os.path.exists("images"):
    os.makedirs("images")

# Function to download the images from the given URL and save them with the given name
def download_image(image_url, image_name):
    try:
        response = requests.get(image_url, stream=True)
        response.raise_for_status()  # Raise an exception for non-200 status codes

        with open(f"images/{image_name}", "wb") as f:
            for chunk in response.iter_content(chunk_size=8192):
                f.write(chunk)
    except requests.exceptions.RequestException as e:
        print(f"Error   
 downloading {image_url}: {e}")

# Iterate over the rows of the DataFrame and download the images
for _, row in df.iterrows():
    download_image(row["screenshot"], row["image_name"])

# Print the confirmation message for the downloaded images
print("Downloaded all images and saved them in the images folder.")