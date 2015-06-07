import requests
import BeautifulSoup as bs
import rap

session = requests.session()

count = 0
for artist, song in rap.r:
	count += 1
	url = 'http://www.metrolyrics.com/'+ song +'-lyrics-' + artist + '.html'
	fn = "rap_songs/" + artist + "+" + song + ".txt"
	response = session.get(url)
	soup = bs.BeautifulSoup(response.text.encode('utf-8'))
	# soup = bs.BeautifulSoup(req.content)
	
	[s.extract() for s in soup(['style', 'script', '[document]', 'head', 'title'])]

	comments = soup.findAll(text=lambda text:isinstance(text, bs.Comment))
	[comment.extract() for comment in comments]

	soup.prettify()

	for br in soup.findAll('br'):
		br.replaceWith('-')

	

	lyrics = soup.findAll('div', { "id" : "lyrics-body-text" })
	# print lyrics

	
	with open(fn, 'w') as f:
		print
		for lyric in lyrics:
			print "Song number {0}: {1} by {2}".format(count, song, artist)
			f.write( lyric.text.encode("utf-8").replace('-', ' ') )	