# This Script implements Fisher’s linear discriminant classifier 
# that can recognize scanned images of the 26 lower-case characters
library(imager)
library(jpeg)
library(readbitmap)
# Step 1 :
#--------- Load training data
# each character have 7 images and 144 pixel(feature)
# so lets make for each charachter matrix 7 rows and 144 column
#-----------------------------
#first Read one image
# helper link:
# https://www.rdocumentation.org/packages/readbitmap/versions/0.1-4/topics/read.bitmap
imgpath = '/home/rana/Desktop/fisher-linear-classiffier/Train/A1a1.jpg'
img <- readJPEG(imgpath, native = TRUE)
dim(img)




