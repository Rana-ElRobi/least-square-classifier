# This Script implements Fisher’s linear discriminant classifier 
# that can recognize scanned images of the 26 lower-case characters
library(imager)
library(jpeg)
library(readbitmap)
library(MASS)
# Step 1 :
#--------- Load training data----------------------
# each character have 7 images and 144 pixel(feature)
# so lets make for each charachter matrix 7 rows and 144 column
# ----------------------------------------------------
# ================= Combine Paths ====================
mainpath = '/home/rana/Desktop/fisher-linear-classiffier/Train/A1'
endpath  = '.jpg'
#-----------------------------
characters = list('a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z')
#-----------------------------
# Lets combine paths
paths = list()
countPaths = 1
for (c in (1:26)){  # Loop on each character
  for (n in (1:7)){ # loop on the 7 imges of each character
    part1  = paste( mainpath , characters[[c]], sep="") 
    part2  = paste(n , endpath, sep="") # comine teh current path
    paths[countPaths] = paste(part1 ,part2, sep="")
    countPaths = countPaths + 1 # increment list path position
  }
}
# =====================================================
# ================= Read All images ===================
# helper link for reading images data :
# https://www.rdocumentation.org/packages/readbitmap/versions/0.1-4/topics/read.bitmap
#-------------------------------------------------------
# heper link for matrix initialization:
# https://www.r-bloggers.com/making-matrices-with-zeros-and-ones/
#--------------------------------------------------------
images.matrix = matrix(0, 1, 145) # initialize zeros matrix 1 row 145 column 
#img.count = 1
for (curr in (1:182)){  # Loop on the paths list
  curr.img = readJPEG(paths[[curr]], native = FALSE)
  # sort pixels in one list of features
  # Now ---------- lets read all pixels in on list of 144 feature
  curr_pixels = list()
  count = 1   # counter of features list
  for (x in 1:12){    # loop on x axis 
    for (y in 1:12){  # loop on y axis
      curr_pixels[count] = curr.img[x,y] # append pixel value in list of features
      count = count + 1 # incremant index of list
    }
  }
  # Append 1 as class lable classifer training
  curr_pixels[count] = 1
  # combin as row to the main data matrix
  images.matrix = rbind(images.matrix,as.double(curr_pixels))
}
#------------------------------------------------------------------------- 
# =================== Lets Start the Algorithm ===================
# Equation is :
# W.par = [ (x.parTranspose * x.par).invers ]*[ x.parTranspose * target.Lables ]
# Helper link for math methods
# http://www.statmethods.net/advstats/matrix.html
#------------------------------------------------------------------------
# Delete the 1st row as it was zeros for just initialization
x.par = as.matrix(images.matrix[2:183,1:145])# now we have x.par
dim(x.par)
x.parTranspose = t(x.par) # get transpose
dim(x.parTranspose)
# multiply xpar to transpose xpar
x.par.Multiply = x.parTranspose  %*% x.par 
dim(x.par.Multiply)
# get invers multiplication
x.par.Mult.invers = ginv(x.par.Multiply)
dim(x.par.Mult.invers)
# Loop to get current target lable
#----------------------
# but now
# set it for 1st calssiffier
# vector of 1st 7 rows are 1 else are -1
class.vector = matrix(1,7,1) # for a class
target.vector = matrix(-1,182,1) # for ALL classes
#overwrite only on according to the loop on characters
# i in the target.vector changes when i write the main loop on the 26 character
for (i in (1:7)){
  # overwrite
  target.vector[i] = class.vector[i] 
}
#----------------------
parTrans.Mult.invers = x.par.Mult.invers %*% x.parTranspose 
dim(parTrans.Mult.invers)
#inversBig.Mult.target = parTrans.Mult.invers %*% target.vector
w.par = parTrans.Mult.invers %*% target.vector # Equation done for classifier character (a)
dim(w.par)
# ----------------------------------







