# https://yijutseng.github.io/DataScienceRBook/io.html#json
#R �y�����D�`�״I�����ظ�ơA�o�Ǹ�Ƶ��j�h�Ƴ��O�H��Ʈء]data.frame�^
#�����c�x�s�A�åB�b�ڭ̶}�� R �y������N�i�H�ϥΡA�Q�n���D�����Ǥ��ظ�ƥi�H�ϥ�
#�A�u�n�b�R�O�C�]Console�^��J:data()
data()  #���ظ��

#���ظ�ƶ��O���ڭ̥i�H�ֳt���ը�ƪ��n����A�`�`�Q���h R �y���ϥΪ̥ΨӴ���
#�����ظ�ƶ��� iris�Bcars�Bmtcars �P airquality �����C
#�p�G��o�Ǥ��ظ�ƶ��P��n�_�A�ڭ̥i�H���d�ߨ�Ƥ@��Ӭd�ߥ��̡A
#�k�U�����d�߰϶��N�|��ܸԲӸ�ơG
?iris
?cars
?airquality

data(Orange)
help(Orange)
head(Orange)
head(Orange,  n=3)  #��ܫe�T�檺���

library(MASS)
data(package = "MASS")     # check MASS package data set
data(VA, package = "MASS")   # use MASS package dataset = VA
help(VA)
head(VA)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##��J��� ------------------------------------------------
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#�p�G�Q�n��J�@�Ӫ��榡����ơ]tabular data�^�A�ڭ̥i�H�ϥ� read.table() ��ơA
#���榡����Ƥ��C�@���N���@���[���ȡA�ܼƥH�Ÿ��Ϲj�]�`�����Ů�Btab �γr���C�^

#txt�ɮ�
file_path <- "d:/data/data_5.txt"     # file_path �Ѽƫ��w��ƪ��ɮ׸��|
#�`�N�׽u����V�Awindows �t�κD�Ϊ� \ �O���Q�{�o��

#header �Ѽƫ��w��ƪ��Ĥ@���O�_���ܼƦW��
#stringsAsFactors �Ѽƫ��w��Ƥ�����r�O�_�n�x�s���]���V�q����Ƶ��c
#stringsAsFactors=FALSE���ܤ��|�N�r��۰��ഫ���]�l�]Factor�^�A�ӫO����r���ƫ��A

import_txt <- read.table(file_path, header = TRUE, stringsAsFactors = FALSE)  
View(import_txt)
edit(import_txt)

#csv�ɮסF �h�@��sep","�Fsep = "\t"���w���j�줸)
#Ū�J�o�Ӹ�ƪ��g�k�ݭn�ק� sep �Ѽƪ��]�w�A�]���w�] sep �Ѽƥu����Ѥ@�ө�
#�h�ӪŮ�A�J�M�ڭ̲{�b��H�r���Ϲj�ܼơA�N�o���w���������j�Ÿ��Gsep = ","
file_path <- "d:/data/data_5.csv"
import_csv <- read.table(file_path, header = TRUE, stringsAsFactors = FALSE, sep = ",")
View(import_csv)
  
  ddd<-read.csv("d:/data/customer.csv", header=T, sep=",")

#�[�{�j�Ǻ��W���ո���x�s�w (https://archive.ics.uci.edu/ml/index.php)
url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-red.csv"
wine_quality <- read.table(url, header = TRUE, sep = ";")
View(wine_quality)

file_url <- "https://s3-ap-northeast-1.amazonaws.com/r-essentials/friends_cast.csv"
friends_cast <- read.table(file_url, header = TRUE, stringsAsFactors = FALSE, sep = ",")
View(friends_cast)

#readLines() ���
#�ëD�Ҧ��ڭ̷QŪ�J���ɮ׳��O�H���j�Ÿ�²����j�����榡��ơA���O�@���G
#�o�ɧڭ̥i�H�Q�� readLines() �@���@��Ū�J�o����ơG
file_path <- "d:/data/read_line.txt"
import_line <- readLines(file_path)
import_line

#readLines() ��Ʀ^�Ǫ�����O�@�Ӥ�r���V�q�A�C�ӯ��ޭȴN�O��l��r�ɤ����@����T�A
#���ϭ�l��r�ɫD�`�e�j�A�ڭ̥i�H�[�J�Ѽ� n �ӭ��wŪ�J�����ơG
friends_script <- readLines(file_path, n = 2)
friends_script

file_path <- "https://s3-ap-northeast-1.amazonaws.com/r-essentials/friends_script.txt"
friends_script <- readLines(file_path, n = 2)
friends_script

#�`���Ψ��x�s��ƪ��榡�٦� Excel �պ���P JSON�A�ڭ̥�������M��ӻ��U�ڭ̿�J�o�Ǹ�Ʈ榡�G
#R �y���ϥήM�󪺵{�Ǧ���Ӷ��q�A�@�ӬO�w�ˡA�t�~�@�ӬO���J�C
#�o��̪��ϧO�N���O�R�u��Ѹ�d�ߤu��ѡA�w�ˮM��N���O�N�o���u��ѶR�^�a�̩�m�b���d�F
#���J�M��N���O���ݨD�ɱN�u��ѱq���d���U�d�ߡC
#�ڭ̨ϥ� install.packages() ��ƨӦw�ˮM��A�M��A�ϥ� library() ��Ƹ��J�M��C

#Excel �պ��	�M��:readxl  #�]�i�ѥk�U������A�w�˩M���}�M��
# �w�˻P���J�M��
#install.packages("readxl") # �p�G���e�w�g�w�˹L�N���ΰ���o��
library(readxl)
file_path <- "d:/data/data_xl.xlsx"
import_xl <- read_excel(file_path)  # �w�]Ū����1�Ӥu�@��
    #import_xl <- read_excel(file_path,1)  # ���w��1�Ӥu�@��
    #import_xl <- read_excel(file_path,"qqq")  ## ���w�u�@���W��
import_xl

# �H�U�� �i��---------------------------------------------------------------
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#JSON�FJSON �O JavaScript Object Notation ���Y�g�A�����~�[���o���o�ˤl�G
# �w�˻P���J�M��
#pkgs <- c("readxl", "jsonlite")
#install.packages(pkgs) # �p�G���e�w�g�w�˹L�N���ΰ���o��
library(readxl)
library(jsonlite)

file_url <- "https://s3-ap-northeast-1.amazonaws.com/r-essentials/friends_cast.json"
friends_cast <- fromJSON(file_url)
View(friends_cast)

#�F�����}���  https://data.gov.tw/dataset/6564
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#�i��- web  xml data dowl (https://yijutseng.github.io/DataScienceRBook/io.html#json)
#Extensible markup language 
#�y�z���c�Ƹ�ƪ��y��
#�B�zXML�ɮ׬O����Html���Ϊ���¦
#Components
#Markup �аO - labels that give the text structure
#Content ���� - the actual text of the document
#(���L)�p�ݱNXML�ɮ׶פJR���A�ݭn�w��XML (Temple Lang and CRAN Team 2019) package�A�ϥ�xmlParse()��ƱN�ɮ׶פJ�C�Y�X�{Error: 1: Unknown IO error2: failed to load external entity�A�O�]��XML�M��B�zhttp��https���\�઺���n�A���Jhttr�M���A���ϥ�GET()�\����κ��}�A�A��JxmlParse()�N���|�����D�C
#install.packages(XML)
#install.packages(httr)
library(XML)
library(httr)
xml.url <- "http://www.w3schools.com/xml/plant_catalog.xml"
plants <- xmlParse(rawToChar(GET(xml.url)$content))
plants.l <- t(xmlToList(plants, simplify = TRUE))
length(plants.l)

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##��X��� -------------------------------------------------------
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#�ڭ̥i�H�N R �y������ƮإH���P���榡��X�����¤�r�ɡC
x<-data.frame(sample(1:100,20,replace = T),sample(1:100,20,replace = T),sample(1:100,20,replace = T))
colnames(x)<-c("test1","test2","test3")

#write.table() ���
#write.table() ��ƹw�]��X�ΪŮ�Ϲj�ܼƪ��¤�r�ɡ]sep = " "�^
file_path <- "d:/data/export_1.txt"
write.table(x, file = file_path, row.names = FALSE)

#example 2
example2 <- data.frame(band = c("Beyond", "Beatles"), lead_vocal = c("Wong Ka Kui", "John Lennon"), formed = c(1983, 1960))
file_path <- "d:/data/example2.txt"
write.table(example2, file = file_path, row.names = FALSE)

#write.table() ��ƫ��w�Ѽ� sep = "," �i�H��X�r���Ϲj���¤�r�ɡG
write.table(x, file = file_path, row.names = FALSE, sep = ",")

#writeLines() ���
#�ڭ̥i�H�Q�� jsonlite �M�󴣨Ѫ� toJSON() ��ƱN��Ʈؿ�X�� JSON�G
#install.packages("jsonlite") # �p�G���e�w�g�w�˹L�N���ΰ���o��
library(jsonlite)

x_df <- data.frame(band = c("Beyond", "BB","Mary"), lead_vocal = c("Wong Ka Ku", "Koi Loiwe" ,"John Lennony"), formed = c(1934,1978, 1999))
x_json <- toJSON(x_df)
file_path <- "d:/data/export_line.txt"
writeLines(x_json, con = file_path)

write.table(Orange, file = "d:/data/export_orange.csv",
            sep = ",", col.names = NA)

#sink() ��� �A����R�A����R�����浲�G
sink("d:/data/test_sink.txt")
x<-1:10
mean(x)
sink()

#save ��ƥi�H�N�ܼ��x�s��w�Ф�
x <- c(1.2, 3.4, 5.6)
y <- x ^ 2
save(x, y, file = "d:/data/xy.RData")

#load ��ƫh�i�N�x�s���ܼƸ��J�G
rm(list = ls())   #rm()R�y��������ƥΩ�q���s���R����H�C���i�H�Pls()��ƧR���Ҧ���H�C
load("d:/data/xy.RData")
ls.str()

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#�m���D ----------------------------------------------------------
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#1. �бNMoodel�W���m�߸��(prac1.csv)�A�U����q�����A�öפJR�n��
file_path <- "d:/data/prac1.csv"
import_prac <- read.table(file_path, header = TRUE, stringsAsFactors = FALSE, sep = ",")
View(import_prac)

#2. ����W�D�A�H���ͦ��@��(���W�٬�rrr)�A�R��gender�ܼơB�W�[�@���ܼơA�ñN�ɮ׶ץX
import_prac$rrr <- rnorm(nrow(import_prac))
import_prac$gender<-NULL
import_prac

file_path <- "d:/data/import_prac.csv"
write.table(import_prac, file = file_path, row.names = FALSE)
    #write.table(x, file = file_path, row.names = FALSE, sep = ",")

#3.�p��import_prac����v5�Bv6�Bv7�ܼƥ����ơA�å�sink���O�O���U��
sink("d:/data/test_sink.txt")
mean(import_prac$v5)
mean(import_prac$v6)
mean(import_prac$v7)
sink()

#4. �m�߱N�[�{�j�Ǻ��W���ո���x�s�w http://archive.ics.uci.edu/ml/machine-learning-databases/iris/bezdekIris.data �� iris ���Ū�J
url <- "http://archive.ics.uci.edu/ml/machine-learning-databases/iris/bezdekIris.data"
iris_ex <- read.table(url, header = F, sep = ",")
iris_ex

#5. �[�{�j�Ǻ��W���ո���x�s�w�� iris ��ƲĤ@���ä��O�ܼƦW�١A�Юھ� http://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.names �o�ӳs�����y�z��Ū�J������ܼƩR�W

names(iris_ex) <- c("sepal length", "sepal width", "petal length", "petal width","class")

#6. �m�߱N���ظ�� cars ��X�� prac_car.txt �ܥ������|�A�O���n���w�Ѽ� row.names = FALSE
file_path <- "d:/data/prac_car.txt"   # �ۭq
write.csv(cars, file = file_path, row.names = F)


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~``
#�@���ƪ��פJ�P�ץX�i�H���Ҷq�u�@�ؿ��������C
#R/Python�n��㦳�u�@�ؿ��]Working Directory�^�����A�Y�w�]Ū����ƪ��ؿ��C
#�ϥ�getwd��ƥH���o�u�@�ؿ��A�]�w�u�@�ؿ���setwd��ơC

setwd("C:/rdata")
getwd()
## [1] "C:/rdata"

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#�k�W���ʦ��פJ���: https://yijutseng.github.io/DataScienceRBook/io.html

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# �iŪ�J����ƻP�M��
# MySQL RMySQL
# HDF5 rhdf5
# Weka foreign
# Stata foreign
# SPSS Hmisc
# SAS Hmisc
# GIS rgdal
# Images jpeg
# Music tuneR

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set.seed(15)
xq <- rnorm(100)
png("output.png", width = 640, height = 360) # �]�w��X����
#pdf("output.pdf", width = 4, height = 3)
hist(xq) # ø��
dev.off() # ������X����

#�p�G�n�N R ��ø�s���ϧΩ�b LaTeX ���ϥΡA
#�i�H�ϥ� postscript ���O��X���A�Ω� LaTeX ���Ҫ� eps �V�q���ɡG
postscript("output.eps", width = 4.0, height = 3.0,
           horizontal = FALSE, onefile = FALSE, paper = "special",
           family = "ComputerModern", encoding = "TeXtext.enc")
hist(xq)
dev.off()

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#�����D�A�ݸ�
library(jsonlite)
library(RCurl)
PetData<-fromJSON(getURL("http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=f4a75ba9-7721-4363-884d-c3820b0b917c"))

str(PetData)
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# rio �����D�A�ݸ�
#R �� rio �M��O�@�Ӻ�X�����ɮ׶פJ�P�ץX�u��M��A�䴩�U�ر`�����ɮ׮榡�C
#https://cran.r-project.org/web/packages/rio/vignettes/rio.html
install.packages("rio")

library(rio)

export(iris, "d:/data/iris.csv") # CSV ��
export(iris, "d:/data/iris.rds") # RDS ��
#export(iris, "d:/data/iris.dta") # Stata ��

iris.1 <- import("d:/data/iris.csv") # CSV ��
iris.2 <- import("d:/data/iris.rds") # RDS ��
#iris.3 <- import("d:/data/iris.dta") # Stata ��

#iris.4 <- import("d:/data/iris", format = "csv")

#head(import("mtcars_noext", format = "csv"))

#�q����Ū����� (�d�Ҩӷ�:)
url <- "https://data.cdc.gov.tw/dataset/aagstable-19cov/resource/27ed0b70-c28f-4a44-8a1b-ef13e487ed20"
import_web <- read.table(url, header = TRUE, stringsAsFactors = FALSE, sep = "," )
View(import_web)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
waterQ <- plants
xpathSApply(waterQ,"//code_name",xmlValue)[1:10]
xpathSApply(waterQ,"//longitude",xmlValue)[1:10]