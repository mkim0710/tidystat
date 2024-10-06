# Generate a script for batch downloading the images and naming each file using the theme_name
download_script = """
import os
import requests

# Create a directory to save the images
output_dir = 'rstudio_theme_images'
os.makedirs(output_dir, exist_ok=True)

# List of theme names and corresponding image URLs
themes = [
"""

# Add each theme and URL as a dictionary entry
for _, row in df_markdown.iterrows():
    download_script += f"    {{'theme_name': '{row['theme_name']}', 'url': '{row['screenshot']}'}},\n"

download_script += """
]

# Function to download each image
for theme in themes:
    response = requests.get(theme['url'])
    if response.status_code == 200:
        file_path = os.path.join(output_dir, theme['theme_name'].replace(' ', '_') + '.png')
        with open(file_path, 'wb') as f:
            f.write(response.content)
        print(f"Downloaded: {theme['theme_name']}")
    else:
        print(f"Failed to download: {theme['theme_name']}")
"""

# Save the script to a file
script_file_path = '/mnt/data/download_images.py'
with open(script_file_path, 'w') as f:
    f.write(download_script)

script_file_path