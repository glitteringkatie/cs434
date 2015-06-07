import requests
import BeautifulSoup as bs
import country

session = requests.session()

for song, artist in country.c.iteritems():
	url = 'http://www.metrolyrics.com/'+ song +'-lyrics-' + artist + '.html'
	fn = "country_songs/" + artist + "+" + song + ".txt"
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
		for lyric in lyrics:
			print "{0} by {1}".format(song, artist)
			f.write( lyric.text.encode("utf-8").replace('-', ' ') )
	


