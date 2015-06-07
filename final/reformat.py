# reformat lyrics as list
import os
import sys
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

<<<<<<< HEAD


=======
if __name__ == '__main__':
<<<<<<< HEAD
	main()
=======
	print get_lyrics('country_songs')
	#main()
>>>>>>> f3b4ec5ce3ce333cff72f361c6d36a9b387db56c
>>>>>>> 9f0e192c3808f8ab1fdb94165300777a3c69dc6a


