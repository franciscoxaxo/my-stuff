
#' orderMatch
#'
#' @param BigDataset
#' @param complementaryDataset
#' @param colMatch
#' @param complementaryColMatch
#' @param mergeCol
#'
#' @return
#' @export
#'
#' @examples
orderMatch <- function(BigDataset, complementaryDataset, colMatch, complementaryColMatch, mergeCol){

  ct <-NULL
  j <- NULL
  cy <-NULL
  datac <- NULL
  newCol <- NULL

  k = 0

  for(j in 1:nrow(BigDataset)){
    if(j%%3000 == 0){
      print(j)
    }
    datac <- data[j, colMatch]
    proof = TRUE
    if(k > 10){
      k = k - 9
    }else{
      k = 0
    }
    while(proof & k <= nrow(complementaryDataset)){
      k = k + 1
      cy <- complementaryDataset[k,  complementaryColMatch]
      if(datac == cy){
        print(datac)
        ct <- complementaryDataset[k,  mergeCol]
        newCol <- c(newCol, ct)
        proof = FALSE
      } else if(k == nrow(complementaryDataset) & datac != cy){
        newCol <- c(newCol, NA)
        proof = FALSE
      }
    }
  }
  data_total <- data.frame(BigDataset, newCol)
  return(data_total)
}

