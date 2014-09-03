## ------------------------------------------------------------------------
library(recosystem)
set.seed(123) # this is a randomized algorithm
trainset = system.file("dat", "smalltrain.txt", package = "recosystem")
testset = system.file("dat", "smalltest.txt", package = "recosystem")
r = Reco()
r$convert_train(trainset)
r$convert_test(testset)
r$train(opts = list(dim = 100, niter = 100,
                    cost.p = 0.001, cost.q = 0.001))
print(r)
outfile = tempfile()
r$predict(outfile)

## Compare the first few true values of testing data
## with predicted ones
# True values
print(read.table(testset, header = FALSE, sep = " ", nrows = 10)$V3)
# Predicted values
print(scan(outfile, n = 10))

