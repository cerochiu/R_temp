# https://yijutseng.github.io/DataScienceRBook/io.html#json
#R 語言有非常豐富的內建資料，這些資料絕大多數都是以資料框（data.frame）
#為結構儲存，並且在我們開啟 R 語言之後就可以使用，想要知道有哪些內建資料可以使用
#，只要在命令列（Console）輸入:data()
data()  #內建資料

#內建資料集是讓我們可以快速測試函數的好幫手，常常被眾多 R 語言使用者用來測試
#的內建資料集有 iris、cars、mtcars 與 airquality 等等。
#如果對這些內建資料集感到好奇，我們可以像查詢函數一般來查詢它們，
#右下角的查詢區塊就會顯示詳細資料：
?iris
?cars
?airquality

data(Orange)
help(Orange)
head(Orange)
head(Orange,  n=3)  #顯示前三行的資料

library(MASS)
data(package = "MASS")     # check MASS package data set
data(VA, package = "MASS")   # use MASS package dataset = VA
help(VA)
head(VA)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##輸入資料 ------------------------------------------------
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#如果想要輸入一個表格式的資料（tabular data），我們可以使用 read.table() 函數，
#表格式的資料中每一筆代表一個觀測值，變數以符號區隔（常見有空格、tab 或逗號。）

#txt檔案
file_path <- "d:/data/data_5.txt"     # file_path 參數指定資料的檔案路徑
#注意斜線的方向，windows 系統慣用的 \ 是不被認得的

#header 參數指定資料的第一筆是否為變數名稱
#stringsAsFactors 參數指定資料中的文字是否要儲存為因素向量的資料結構
#stringsAsFactors=FALSE表示不會將字串自動轉換為因子（Factor），而保持原字串資料型態

import_txt <- read.table(file_path, header = TRUE, stringsAsFactors = FALSE)  
View(import_txt)
edit(import_txt)

#csv檔案； 多一個sep","；sep = "\t"指定分隔位元)
#讀入這個資料的寫法需要修改 sep 參數的設定，因為預設 sep 參數只能辨識一個或
#多個空格，既然我們現在改以逗號區隔變數，就得指定對應的分隔符號：sep = ","
file_path <- "d:/data/data_5.csv"
import_csv <- read.table(file_path, header = TRUE, stringsAsFactors = FALSE, sep = ",")
View(import_csv)
  
  ddd<-read.csv("d:/data/customer.csv", header=T, sep=",")

#加州大學爾灣分校資料儲存庫 (https://archive.ics.uci.edu/ml/index.php)
url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-red.csv"
wine_quality <- read.table(url, header = TRUE, sep = ";")
View(wine_quality)

file_url <- "https://s3-ap-northeast-1.amazonaws.com/r-essentials/friends_cast.csv"
friends_cast <- read.table(file_url, header = TRUE, stringsAsFactors = FALSE, sep = ",")
View(friends_cast)

#readLines() 函數
#並非所有我們想讀入的檔案都是以分隔符號簡潔分隔的表格式資料，像是劇本：
#這時我們可以利用 readLines() 一筆一筆讀入這份資料：
file_path <- "d:/data/read_line.txt"
import_line <- readLines(file_path)
import_line

#readLines() 函數回傳的物件是一個文字的向量，每個索引值就是原始文字檔中的一筆資訊，
#假使原始文字檔非常龐大，我們可以加入參數 n 來限定讀入的筆數：
friends_script <- readLines(file_path, n = 2)
friends_script

file_path <- "https://s3-ap-northeast-1.amazonaws.com/r-essentials/friends_script.txt"
friends_script <- readLines(file_path, n = 2)
friends_script

#常見用來儲存資料的格式還有 Excel 試算表與 JSON，我們必須仰賴套件來輔助我們輸入這些資料格式：
#R 語言使用套件的程序有兩個階段，一個是安裝，另外一個是載入。
#這兩者的區別就像是買工具書跟查詢工具書，安裝套件就像是將這本工具書買回家裡放置在書櫃；
#載入套件就像是有需求時將工具書從書櫃取下查詢。
#我們使用 install.packages() 函數來安裝套件，然後再使用 library() 函數載入套件。

#Excel 試算表	套件:readxl  #也可由右下方視窗，安裝和打開套件
# 安裝與載入套件
#install.packages("readxl") # 如果先前已經安裝過就不用執行這行
library(readxl)
file_path <- "d:/data/data_xl.xlsx"
import_xl <- read_excel(file_path)  # 預設讀取第1個工作表
    #import_xl <- read_excel(file_path,1)  # 指定第1個工作表
    #import_xl <- read_excel(file_path,"qqq")  ## 指定工作表名稱
import_xl

# 以下為 進階---------------------------------------------------------------
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#JSON；JSON 是 JavaScript Object Notation 的縮寫，它的外觀長得像這樣子：
# 安裝與載入套件
#pkgs <- c("readxl", "jsonlite")
#install.packages(pkgs) # 如果先前已經安裝過就不用執行這行
library(readxl)
library(jsonlite)

file_url <- "https://s3-ap-northeast-1.amazonaws.com/r-essentials/friends_cast.json"
friends_cast <- fromJSON(file_url)
View(friends_cast)

#政府公開資料  https://data.gov.tw/dataset/6564
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#進階- web  xml data dowl (https://yijutseng.github.io/DataScienceRBook/io.html#json)
#Extensible markup language 
#描述結構化資料的語言
#處理XML檔案是網頁Html爬蟲的基礎
#Components
#Markup 標記 - labels that give the text structure
#Content 內文 - the actual text of the document
#(跳過)如需將XML檔案匯入R中，需要安裝XML (Temple Lang and CRAN Team 2019) package，使用xmlParse()函數將檔案匯入。若出現Error: 1: Unknown IO error2: failed to load external entity，是因為XML套件處理http轉https的功能的不好，載入httr套件後，先使用GET()功能取用網址，再放入xmlParse()就不會有問題。
#install.packages(XML)
#install.packages(httr)
library(XML)
library(httr)
xml.url <- "http://www.w3schools.com/xml/plant_catalog.xml"
plants <- xmlParse(rawToChar(GET(xml.url)$content))
plants.l <- t(xmlToList(plants, simplify = TRUE))
length(plants.l)

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##輸出資料 -------------------------------------------------------
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#我們可以將 R 語言的資料框以不同的格式輸出成為純文字檔。
x<-data.frame(sample(1:100,20,replace = T),sample(1:100,20,replace = T),sample(1:100,20,replace = T))
colnames(x)<-c("test1","test2","test3")

#write.table() 函數
#write.table() 函數預設輸出用空格區隔變數的純文字檔（sep = " "）
file_path <- "d:/data/export_1.txt"
write.table(x, file = file_path, row.names = FALSE)

#example 2
example2 <- data.frame(band = c("Beyond", "Beatles"), lead_vocal = c("Wong Ka Kui", "John Lennon"), formed = c(1983, 1960))
file_path <- "d:/data/example2.txt"
write.table(example2, file = file_path, row.names = FALSE)

#write.table() 函數指定參數 sep = "," 可以輸出逗號區隔的純文字檔：
write.table(x, file = file_path, row.names = FALSE, sep = ",")

#writeLines() 函數
#我們可以利用 jsonlite 套件提供的 toJSON() 函數將資料框輸出為 JSON：
#install.packages("jsonlite") # 如果先前已經安裝過就不用執行這行
library(jsonlite)

x_df <- data.frame(band = c("Beyond", "BB","Mary"), lead_vocal = c("Wong Ka Ku", "Koi Loiwe" ,"John Lennony"), formed = c(1934,1978, 1999))
x_json <- toJSON(x_df)
file_path <- "d:/data/export_line.txt"
writeLines(x_json, con = file_path)

write.table(Orange, file = "d:/data/export_orange.csv",
            sep = ",", col.names = NA)

#sink() 函數 ，紀錄R，紀錄R的執行結果
sink("d:/data/test_sink.txt")
x<-1:10
mean(x)
sink()

#save 函數可以將變數儲存於硬碟中
x <- c(1.2, 3.4, 5.6)
y <- x ^ 2
save(x, y, file = "d:/data/xy.RData")

#load 函數則可將儲存的變數載入：
rm(list = ls())   #rm()R語言中的函數用於從內存中刪除對象。它可以與ls()函數刪除所有對象。
load("d:/data/xy.RData")
ls.str()

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#練習題 ----------------------------------------------------------
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#1. 請將Moodel上的練習資料(prac1.csv)，下載到電腦中，並匯入R軟體
file_path <- "d:/data/prac1.csv"
import_prac <- read.table(file_path, header = TRUE, stringsAsFactors = FALSE, sep = ",")
View(import_prac)

#2. 接續上題，隨機生成一欄(欄位名稱為rrr)，刪除gender變數、增加一欄變數，並將檔案匯出
import_prac$rrr <- rnorm(nrow(import_prac))
import_prac$gender<-NULL
import_prac

file_path <- "d:/data/import_prac.csv"
write.table(import_prac, file = file_path, row.names = FALSE)
    #write.table(x, file = file_path, row.names = FALSE, sep = ",")

#3.計算import_prac中的v5、v6、v7變數平均數，並用sink指令記錄下來
sink("d:/data/test_sink.txt")
mean(import_prac$v5)
mean(import_prac$v6)
mean(import_prac$v7)
sink()

#4. 練習將加州大學爾灣分校資料儲存庫 http://archive.ics.uci.edu/ml/machine-learning-databases/iris/bezdekIris.data 的 iris 資料讀入
url <- "http://archive.ics.uci.edu/ml/machine-learning-databases/iris/bezdekIris.data"
iris_ex <- read.table(url, header = F, sep = ",")
iris_ex

#5. 加州大學爾灣分校資料儲存庫的 iris 資料第一筆並不是變數名稱，請根據 http://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.names 這個連結的描述為讀入的資料變數命名

names(iris_ex) <- c("sepal length", "sepal width", "petal length", "petal width","class")

#6. 練習將內建資料 cars 輸出為 prac_car.txt 至本機路徑，記住要指定參數 row.names = FALSE
file_path <- "d:/data/prac_car.txt"   # 自訂
write.csv(cars, file = file_path, row.names = F)


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~``
#一般資料的匯入與匯出可以先考量工作目錄的概念。
#R/Python軟體具有工作目錄（Working Directory）概念，即預設讀取資料的目錄。
#使用getwd函數以取得工作目錄，設定工作目錄為setwd函數。

setwd("C:/rdata")
getwd()
## [1] "C:/rdata"

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#右上方手動式匯入資料: https://yijutseng.github.io/DataScienceRBook/io.html

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 可讀入的資料與套件
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
png("output.png", width = 640, height = 360) # 設定輸出圖檔
#pdf("output.pdf", width = 4, height = 3)
hist(xq) # 繪圖
dev.off() # 關閉輸出圖檔

#如果要將 R 所繪製的圖形放在 LaTeX 中使用，
#可以使用 postscript 指令輸出成適用於 LaTeX 環境的 eps 向量圖檔：
postscript("output.eps", width = 4.0, height = 3.0,
           horizontal = FALSE, onefile = FALSE, paper = "special",
           family = "ComputerModern", encoding = "TeXtext.enc")
hist(xq)
dev.off()

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#有問題，待解
library(jsonlite)
library(RCurl)
PetData<-fromJSON(getURL("http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=f4a75ba9-7721-4363-884d-c3820b0b917c"))

str(PetData)
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# rio 有問題，待解
#R 的 rio 套件是一個綜合型的檔案匯入與匯出工具套件，支援各種常見的檔案格式。
#https://cran.r-project.org/web/packages/rio/vignettes/rio.html
install.packages("rio")

library(rio)

export(iris, "d:/data/iris.csv") # CSV 檔
export(iris, "d:/data/iris.rds") # RDS 檔
#export(iris, "d:/data/iris.dta") # Stata 檔

iris.1 <- import("d:/data/iris.csv") # CSV 檔
iris.2 <- import("d:/data/iris.rds") # RDS 檔
#iris.3 <- import("d:/data/iris.dta") # Stata 檔

#iris.4 <- import("d:/data/iris", format = "csv")

#head(import("mtcars_noext", format = "csv"))

#從網路讀取資料 (範例來源:)
url <- "https://data.cdc.gov.tw/dataset/aagstable-19cov/resource/27ed0b70-c28f-4a44-8a1b-ef13e487ed20"
import_web <- read.table(url, header = TRUE, stringsAsFactors = FALSE, sep = "," )
View(import_web)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
waterQ <- plants
xpathSApply(waterQ,"//code_name",xmlValue)[1:10]
xpathSApply(waterQ,"//longitude",xmlValue)[1:10]
