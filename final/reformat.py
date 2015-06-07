# reformat lyrics as list
import os

def get_lyrics(folder):
	
	songs = []
	for title in os.listdir(folder):
		with open(folder + title) as songfile:
			songs.append(songfile.read())

	return songs





