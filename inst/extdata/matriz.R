#install.packages("tidyverse")
#install.packages("plotly")

library(tidyverse)
library(plotly)





matrizRelacional<- function(df, criterio1, criterio2){
  subset1 <- df %>% dplyr::filter(Question == criterio1)
  subset2 <- df %>% dplyr::filter(Question == criterio2)
  labelsCol <- as.vector(unique(subset2[[6]]))
  labelsRow <- as.vector(unique(subset1[[6]]))
  rowSubset1 <- nrow(subset1)
  rowSubset2 <- nrow(subset2)

  row <- length(labelsRow)
  col <- length(labelsCol)

  baseMatrix <- matrix(0, nrow = row, ncol = col)
  row.names(baseMatrix) <- labelsRow
  colnames(baseMatrix) <- labelsCol

  for(i in 1:rowSubset1){
    valueSubset1 <- subset1[i, 6]
    index1 <- subset1[i, 1]
    index_row_matrix <- which(row.names(baseMatrix)== valueSubset1)
    for(j in 1:rowSubset2){
      if(index1 == subset2[j, 1]){
        valueSubset2 <- subset2[j, 6]
        index_col_matrix <- which(colnames(baseMatrix) == valueSubset2)
        baseMatrix[index_row_matrix, index_col_matrix] = baseMatrix[index_row_matrix, index_col_matrix] + 1
        #print(paste("i. ",i , "j: ", j ))
      }
    }
  }

  return(baseMatrix)
}
sankey <- function(matriz){
  matriz <- as.data.frame(matriz)
  label <- c(row.names(matriz), colnames(matriz))
  #print(label)
  source <- NULL
  target <- rep((nrow(matriz)):(nrow(matriz)+ncol(matriz) - 1), nrow(matriz))
  #print(target)
  value  <- NULL
  for(i in 1:nrow(matriz)){
    aux <- rep(i - 1, ncol(matriz))
    source <- c(source, aux)
    for(j in 1:ncol(matriz)){
      value <- c(value, matriz[i, j])
    }

  }
  #print(source)
  #print(value)

  fig <- plot_ly(
    type = "sankey",
    orientation = "h",

    node = list(
      label = label,

      pad = 15,
      thickness = 20,
      line = list(
        color = "black",
        width = 0.5
      )
    ),

    link = list(
      source = source,
      target = target,
      value =  value
    )
  )
  fig <- fig %>% layout(
    title = "Basic Sankey Diagram",
    font = list(
      size = 10
    )
  )

  return(fig)
}

#matriz <- matrizRelacional(data_df, criterio1 , criterio2)
#sankey(matriz)


