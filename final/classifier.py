from sklearn.feature_extraction.text import CountVectorizer
from sklearn.datasets import fetch_20newsgroups
categories = ['alt.atheism', 'soc.religion.christian', 'comp.graphics', 'sci.med']
twenty_train = fetch_20newsgroups(subset='train', categories=categories, shuffle=True, random_state=42)
print type(twenty_train.data[0])

# count_vect = CountVectorizer()
# X_train_counts = count_vect.fit_transform(twenty_train.data)
# print X_train_counts.shape