from sklearn.feature_extraction.text import CountVectorizer

import reformat
mylist = reformat.get_lyrics('country_songs')

count_vect = CountVectorizer()
X_train_counts = count_vect.fit_transform(count_vect)
print X_train_counts.shape