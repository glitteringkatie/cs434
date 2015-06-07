# learning libraries
from sklearn.feature_extraction.text import CountVectorizer, TfidfTransformer
from sklearn.naive_bayes import MultinomialNB
from sklearn.linear_model import SGDClassifier
from sklearn.pipeline import Pipeline
import numpy as np
# other libraries
import sys
# our libraries
import reformat

# get training lyrics as list
lyrics, labels = reformat.get_all_lyrics('training')
test_lyrics, test_labels = reformat.get_all_lyrics('testing')

# create a learning pipeline
text_clf = Pipeline([('vect', CountVectorizer()),
                    ('tfidf', TfidfTransformer()),
                    ('clf', MultinomialNB())
					])
# train the classifier
text_clf = text_clf.fit(lyrics, labels)

# make predictions
predicts = text_clf.predict(test_lyrics)

# find accuracy
print "This classifier is {:.1f}% accurate".format(100*np.mean(predicts == test_labels))

try:
	demo_filename = sys.argv[1]
except IndexError, e:
	print "Usage: classify <filename>"
	sys.exit(1)

with open(demo_filename) as f:
	demo_lyrics = [f.read()]


prediction = text_clf.predict(demo_lyrics)[0]
certainty = np.max(text_clf.predict_proba(demo_lyrics)[0])

print "We are {:.1f} % sure that {} is a {} song.".format(certainty*100, demo_filename, prediction)
