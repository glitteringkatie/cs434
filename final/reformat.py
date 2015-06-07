# reformat lyrics as list
import os
import sys

def get_all_lyrics(folder):
	country = get_lyrics(folder + '/country_songs')
	rap = get_lyrics(folder + '/rap_songs')
	lyrics = country + rap
	labels = ["country" for i in country] + ["rap" for i in rap]

	return lyrics, labels


def get_lyrics(folder, classlabel=None):
	songs = []
	for title in os.listdir(folder):
		with open(folder + '/' + title) as songfile:
			if(classlabel is not None):
				songs.append((songfile.read(),int(classlabel)))
			else:
				songs.append(songfile.read())

	return songs

def main():
	folder = sys.argv[1]
	classlabel = sys.argv[2]
	lyrics = get_lyrics(folder,classlabel)
	for song,label in lyrics:
		sys.stdout.write('(' + song + ',' + classlabel + ')')

if __name__ == '__main__':
	main()


