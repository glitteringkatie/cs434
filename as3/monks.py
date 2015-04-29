import monksTrain
import monksTest
import numpy as np
import sys

features = np.array([3, 3, 2, 3, 4, 2])
EPSILON = 0.0000001
THRESHOLD = 0.01


class Node(object):
	def __init__(self, feature, label, benefit, depth, pos, neg):
		self.feature = feature
		self.label = label
		self.benefit = benefit
		self.depth = depth
		self.pos = pos	
		self.neg = neg
		self.yesNode = None
		self.noNode = None
		
	def yes(self, node):
		self.yesNode = node
		
	def no(self, node):
		self.noNode = node
		
	def print_self(self):
		if self.yesNode is not None:
			self.yesNode.print_self()
		print self
		if self.noNode is not None:
			self.noNode.print_self()
		
	def __repr__(self):
		return self.depth * "|" + "x{0} == {1} benefit = {2} +{3} -{4}".format(self.feature, self.label, self.benefit, self.pos, self.neg)


def print_tree(n):
	if n is None:
		return
	print n
	if n.noNode is not None:
		print_tree(n.noNode)
	
	if n.yesNode is not None:
		print_tree(n.yesNode)

def learnStump(M, depth):
	best_feature = -1
	best_label = -1
	best_benefit = -1
	pos = np.sum(M[:, 0])
	neg = M.shape[0] - pos
	
	if M.shape[0] == 0:
		return Node(best_feature, best_label, best_benefit, depth, pos, neg)
	
	for feature in range(1, M.shape[1]):
		for label in range(1, features[feature-1] + 1):
			
			benefit = getBenefit(M, feature, label)
			#print feature, label, benefit
			#print benefit
			if (benefit > best_benefit):
				best_benefit = benefit
				best_feature = feature
				best_label = label
				
	#print "Best Feature = {0}, Best Label = {1}, Benefit = {2}".format(best_feature, best_label, best_benefit)
#	if abs(best_benefit) < THRESHOLD:
	#	return None
	
 	return Node(best_feature, best_label, best_benefit, depth, pos, neg)


def getBenefit(M, feature, label):
	yes = M[M[:, feature] == label]
	no = M[M[:, feature] != label]
	
	yes_ratio = float(yes.shape[0]) / M.shape[0]
	no_ratio = 1 - yes_ratio
	
	if yes.shape[0] == 0:
		return 0
	if no.shape[0] == 0:
		return 0
	
	return entropy(M) - (yes_ratio * entropy(yes)) - (no_ratio * entropy(no))
	
		

def entropy(M):
	pos = np.sum(M[:, 0]) / float(M.shape[0])
	neg = 1 - pos
	
	if abs(pos) < EPSILON:
		return -(neg * np.log2(neg))
	elif abs(neg) < EPSILON:
		return -(pos * np.log2(pos))
	
	return -(pos * np.log2(pos)) - (neg * np.log2(neg))


def learnTree(M, depth):
	if M.shape[0] == 0:
		return None;
	
	#print "M:", M.shape
	root = learnStump(M, depth)
	if root.benefit < THRESHOLD:
		return root
	
	yesM = M[ M[:,root.feature] == root.label ]
	noM = M[ M[:,root.feature] != root.label ]
	
	#print "yes:", yesM.shape
	#print "no:", noM.shape
	root.yes(learnTree(yesM, depth + 1))
	root.no(learnTree(noM, depth + 1))
	
	return root
	

def predict(example, DT):
	if DT.pos > DT.neg:
		prediction = 1
	else:
		prediction = 0
	if example[DT.feature] == DT.label:
		if DT.yesNode is not None:
			return predict(example, DT.yesNode)
		else:
			return prediction
	else:
		if DT.noNode is not None:
			return predict(example, DT.noNode)
		else:
			return prediction

def get_error_tree(M, DT):
	error_sum = 0
	for example in M:
		error_sum += abs(example[0] - predict(example, DT))
	return float(error_sum) / M.shape[0]
	
def get_error_stump(M, stump):
	error_sum = 0
	for example in M:
		if example[stump.feature] == stump.label:
			if stump.yesNode.pos > stump.yesNode.neg:
				prediction = 1
			else:
				prediction = 0
		else:
			if stump.noNode.pos > stump.noNode.neg:
				prediction = 1
			else:
				prediction = 0
				
		error_sum += abs(example[0] - prediction)
	return float(error_sum) / M.shape[0]	


if __name__ == "__main__":
	monksTrainMatrix = np.array(monksTrain.monksTrainMatrix)
	trainX = monksTrainMatrix[:, 1:]
	trainY = monksTrainMatrix[:, 0]
	
	monksTestMatrix =  np.array(monksTest.monksTestMatrix)
	testX = monksTestMatrix[:, 1:]
	testY = monksTestMatrix[:, 0]
	
	DT = learnTree(monksTrainMatrix, 0)
	
	#DT.print_self()
	
	print DT
	print
	print_tree(DT)
	print
	print "Training Stump Error:", get_error_stump(monksTrainMatrix, DT)
	print "Testing Stump Error:", get_error_stump(monksTestMatrix, DT)
	print "Training Tree Error:", get_error_tree(monksTrainMatrix, DT)
	print "Testing Tree Error:", get_error_tree(monksTestMatrix, DT)
	
	
	
	
	
	
	
	
	
	
	

