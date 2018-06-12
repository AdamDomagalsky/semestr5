import csv
import pandas
import numpy
from sklearn import linear_model

def prepare_data_sets():
    train_in_set = pandas.read_csv('train/train_in.tsv', header=None, sep='\t')
    train_out_set = pandas.read_csv('train/train_out.tsv', header=None, sep='\t')
    test_set = pandas.read_csv('test-A/in.tsv', header=None, sep='\t')
    dev_set = pandas.read_csv('dev-0/in.tsv', header=None, sep='\t')

    for col in train_in_set:
        train_in_set[col] = train_in_set[col].map(ord)

    for col in train_out_set:
        train_out_set[col] = train_out_set[col].map(ord)

    for col in test_set:
        test_set[col] = test_set[col].map(ord)

    for col in dev_set:
        dev_set[col] = dev_set[col].map(ord)

    train_in_set.to_csv('train/train_in_06.tsv', header=None, sep='\t', index=False)
    train_out_set.to_csv('train/train_out_06.tsv', header=None, sep='\t', index=False)
    test_set.to_csv('test-A/in_06.tsv', header=None, sep='\t', index=False)
    dev_set.to_csv('dev-0/in_06.tsv', header=None, sep='\t', index=False)

def write_out_file(predictions, out_file):
    with open(out_file, 'w') as f:
        for prediction in predictions:
            f.write(str(chr(int(prediction))) + '\n')

def main():
    # prepare data sets
    prepare_data_sets()

    #  load data
    X_train = numpy.loadtxt('./train/train_in_06.tsv', delimiter='\t')
    y_train = numpy.loadtxt('./train/train_out_06.tsv', delimiter='\t')
    X_test = numpy.loadtxt('./test-A/in_06.tsv', delimiter='\t')
    X_dev = numpy.loadtxt('./dev-0/in_06.tsv', delimiter='\t')

    #  print data
    print('\nX_train:')
    print(X_train)
    print('\ny_train:')
    print(y_train)
    print('\nX_test:')
    print(X_test)
    print('\nX_dev:')
    print(X_dev)

    #  create classifier
    reglog = linear_model.LogisticRegression(C=1e5)

    #  train
    reglog.fit(X_train, y_train)

    #  predict
    predictions = reglog.predict(X_test)
    predictions_dev = reglog.predict(X_dev)

    #  print predictions
    print('\npredictions:')
    print(predictions)
    print('\npredictions:')
    print(predictions_dev)

    #  write outfiles
    write_out_file(predictions, 'test-A/out.tsv')
    write_out_file(predictions_dev, 'dev-0/out.tsv')

if __name__ == "__main__":
    main()
