import os
import shutil
import random

for folder in ['country_songs/', 'rap_songs/']:
	for filename in os.listdir(folder):
		new_folder = random.choice(["training/", "testing/"])
		shutil.copy(folder + filename, new_folder + folder + filename)

