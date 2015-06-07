import string
import re
import sys
import math

pre_train_file = "preprocessed_train.txt"
pre_test_file = "preprocessed_text.txt"
vocabThreshold = 5

#Input: s - an arbitrary string
#Output: lowercase str with all but alpha/space stripped

def strip_string(s):
	regex = re.compile('[^a-zA-Z ]')
	return regex.sub('', s).lower()

#Input: s - an arbitrary string
#Output: list of {word, count} tuples, after stripping s
def count_words(s):
	strip = strip_string(s)
	list = re.split('\s+', strip)
	d = dict([ (i, list.count(i)) for i in set(list) if i != '']).items()
	return sorted(d)

#Input: f - filename of formatted file
#Output: data - list of {[{word, count}], isSarcastic} tuples (lines)
#data[i] represents the ith line data
#data[i][0] represents an associative list of {word, count} tuples for the ith line
#data[i][1] represents whether or not the given line is sarcastic
def parse_file(file):
	#Open training file into list
	with open(file) as f:
		raw_data = f.readlines()
	data = []
	for line in raw_data:
		regex = re.compile('^\("(.+)",([\d])\)$')
		match = re.match(regex, line)
		if match:
			data.append([count_words(match.group(1)), int(match.group(2))])
	return data


#Input: data - list of {[{word, count}], isSarcastic} tuples (lines), as given by parse_file()
#	n - Keep words occuring n or more times in data
#Output: vocab - sorted list of words in the vocabulary
#This is rather inefficient, at something like O(#uniqueWords * #totalWords)
def form_vocab(data, n):
	#Extract all words from data
	words = []
	for i in data:
		words.extend(i[0])
	vocab = []
	word_set = set([i[0] for i in words])
	for i in word_set:
		count = 0
		for j in words:
			if str(i) == str(j[0]):
				count += j[1]
		if count >= n:
			vocab.append( (i, count) )
	return sorted([i[0] for i in vocab])


def vectorize_sentence(sentence, vocab):
	vec = []
	sent = [i[0] for i in sentence]
	for i in vocab:
		if (i in sent):
			vec.append(1)
		else:
			vec.append(0)
	return vec;

def vectorize_data(sentences, vocab):
	vecs = []
	for i in sentences:
		vec = (vectorize_sentence(i[0], vocab), i[1])
		vecs.append(vec)
	return vecs

def prettyVector(vecs, vocab):
	prettyPrint = ""
	for i in vocab:
		prettyPrint += str(i)+","
	prettyPrint += "classlabel\n"
	for i in vecs:
		prettyPrint += ",".join(map(str,i[0])) + "\n"
	return prettyPrint

def teachBayes(vecs):
	labels = [i[1] for i in vecs]
	sentences = [i[0] for i in vecs]
	numRecords = len(sentences)
	numSarcastic = labels.count(1)
	numFeatures = len(sentences[0])
	classPrior = [(math.log(numSarcastic) - math.log(numRecords)), (math.log(numRecords - numSarcastic) - math.log(numRecords))]
	vecPriors = []
	for i in range(numFeatures):
		count = [1,1,1,1]
		for j in range(numRecords):
			if(sentences[j][i] == 0):
				if(labels[j] == 1):
					count[0] += 1
				else:
					count[2] += 1
			elif(sentences[j][i] == 1):
				if(labels[j] == 1):
					count[1] += 1
				else:
					count[3] += 1
		countVec = [math.log(count[i]) - math.log(numSarcastic + 2) for i in range(2)] + [math.log(count[i+2]) - math.log(numRecords - numSarcastic + 2) for i in range(2)]
		vecPriors.append(countVec)
	return (classPrior, vecPriors)	

def classifySentence(vec, logProbs):
	classPrior = logProbs[0]
	vecPriors = logProbs[1]
	posLogProb = classPrior[0]
	negLogProb = classPrior[1]
	for i in range(len(vec)):
		posLogProb += vecPriors[i][vec[i]]
		negLogProb += vecPriors[i][vec[i]+2]
	if(math.exp(posLogProb) > math.exp(negLogProb)):
		return 1
	else:
		return 0

def classifySentences(vecs, logProbs):
	numCorrect = 0
	predictions = []
	labels = [i[1] for i in vecs]
	for i in range(len(labels)):
		prediction = classifySentence(vecs[i][0], logProbs)
		predictions.append(prediction)
		if(prediction == labels[i]):
			numCorrect += 1
	return numCorrect, predictions

def main():
	#Check for files
	if (len(sys.argv) != 3):
		print "Usage: as3.py training_text.txt test_text.txt\n"
		sys.exit(1)

	#Load data, strip/count words
	train_sentences = parse_file(sys.argv[1])
	test_sentences = parse_file(sys.argv[2])

	#Form vocabulary
	vocab = form_vocab(train_sentences + test_sentences, vocabThreshold)

	#Vectorize all the data
	train_vecs = vectorize_data(train_sentences, vocab)
	test_vecs = vectorize_data(test_sentences, vocab)

	#Pretty print vectorized data
	with open(pre_train_file, 'w') as f:
		f.write(prettyVector(train_vecs, vocab))
	with open(pre_test_file, 'w') as f:
		f.write(prettyVector(test_vecs, vocab))

	#Learn from training data
	logProbs = teachBayes(train_vecs)
	#Classify 
	results = classifySentences(test_vecs, logProbs)
	print "Training file:", sys.argv[1], "Testing file:", sys.argv[2]
	print "Vocabulary length:", len(vocab), "Prediction vector:", results[1]
	print results[0], "records classified correctly out of", len(test_vecs), "records\nAccuracy:", (100.0*results[0])/len(test_vecs), "percent."

if __name__ == "__main__":
	main()
