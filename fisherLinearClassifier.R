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
typeof(img)
# This is pixel one value
x = img[1,1]
# Now ---------- lets read all pixels in on list of 144 feature
a_char = list();
count = 1   # counter of features list
for (x in 1:12){    # loop on x axis 
  for (y in 1:12){  # loop on y axis
    a_char[count] = img[x,y] # append pixel value in list of features
    count = count + 1 # incremant index of list
  }
}



