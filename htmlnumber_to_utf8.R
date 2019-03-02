### Function to transform htmlnumbers to utf8
### Neylson Crepalde
### It depends on two tidyverse packages: readr and stringr. You must install them. To do that uncomment the next line:
#install.packages(c("readr", "stringr"))
### No library() function is required.
#########

## Read in the dataset with the conversions
htmlnumbers = readr::read_csv("https://raw.githubusercontent.com/neylsoncrepalde/utf8htmlnumbers/master/utf8_html_numbers.csv")


## The function
htmlnumber_to_utf8 = function(x, data = htmlnumbers) {
  if (!is.character(x)) stop("x is not a character")
  
  res = vector(length = length(x))
  
  for (j in 1:length(x)) {
    for (i in 1:nrow(data)) {
      if (i == 1) {
        res[j] = stringr::str_replace_all(x[j], data$unicode[i], data$utf8[i])
      } else {
        res[j] = stringr::str_replace_all(res[j], data$unicode[i], data$utf8[i])
      }
    }
  }
  
  return(res)
}

## Test
htmlnumber_to_utf8("Jo&#227;o Gon&#231;alv&#232;s Nu&#241;ez")
