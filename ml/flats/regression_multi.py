#!/usr/bin/python2
#-*- coding: utf-8 -*-
import csv
import numpy as np

#data must be a csv with comma ',' delimiter

class multivariableLinearRegression():

    def __init__(self,trainFile,testFile):
        self.train = np.loadtxt(trainFile, delimiter=',')
        self.test = np.loadtxt(testFile, delimiter=',')
        self.shapeData()

    def shapeData(self):
        #shape returns arr of dimensions
        trainDataSet, trainDimensions = self.train.shape
        testDataSet, testDimensions = self.test.shape

        #Dimensions-1 becouse python iters from 0 to n-1
        xTrainSet = self.train[:, 0:trainDimensions - 1].reshape(trainDataSet, trainDimensions - 1)
        #xTestSet = self.test[:, 0:testDimensions - 1].reshape(testDataSet, testDimensions - 1)

        #Prepare data for gradient descend 
        self.xTrainMatrix = np.matrix(np.concatenate((np.ones((trainDataSet, 1)), xTrainSet), axis=1)).reshape(trainDataSet, trainDimensions)
        self.yTrainMatrix = np.matrix(self.train[:, trainDimensions - 1]).reshape(trainDataSet, 1)

    gradientDsc = lambda self, X, y: (X.T*X)**-1*X.T*y

    def trainModel(self):
        self.model = self.gradientDsc(self.xTrainMatrix,self.yTrainMatrix)

    def predict(self):
        for vector in self.test:
            print(float(self.model[0] + self.model[1] * vector[0] + self.model[2] * vector[1] + self.model[3] * vector[2] + self.model[4] * vector[3]))


regression = multivariableLinearRegression('./train/in.csv','./test-A/in.csv')
regression.trainModel()
regression.predict()
