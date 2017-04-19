# This Script implements Fisher’s linear discriminant classifier 
# that can recognize scanned images of the 26 lower-case characters
library(imager)
library(jpeg)
library(readbitmap)
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
# helper link:
# https://www.rdocumentation.org/packages/readbitmap/versions/0.1-4/topics/read.bitmap
#-------------------------------------------------------
images.list = rep(list(list()), 182)  # List of 182 image sorted for all charachters each have 7 
img.count = 1
for (curr in (1:182)){  # Loop on the paths list
  curr.img = readJPEG(paths[[curr]], native = FALSE)
  # sort pixels in one list of features
  # Now ---------- lets read all pixels in on list of 144 feature
  curr_char = list();
  count = 1   # counter of features list
  for (x in 1:12){    # loop on x axis 
    for (y in 1:12){  # loop on y axis
      curr_char[count] = curr.img[x,y] # append pixel value in list of features
      count = count + 1 # incremant index of list
    }
  }
  images.list[[img.count]] = curr_char
  img.count = img.count + 1
}
# Access img no 10 , pixel no 1
#images.list[[10]][1] 
#------------------------------------------------------------------------- 
# =================== Lets Start the Algorithm ===================

