#' my_pkges
#'
#' @return
#' @export
#'
#' @examples
my_pkges<-function(){

  librarys<- c("dplyr", "raster", "tidyverse", "raster", "devtools", "plotly",
               "tensorflow", "reticulate","AtmChile",  "forecast", "rmarkdown", "tinytex", "XML")
  len <- length(librarys)

  for(i in 1:len){
    pkg<- librarys[i]
    print(paste(pkg, "in progress"))
    install.packages(pkg)
    print(paste(pkg, "finished"))
  }
}
tinytex::install_tinytex()
#' my_pkges
#'
#' @return
#' @export
#'
#' @examples
my_pkges<-function(){

  librarys<- c("dplyr", "raster", "tidyverse", "raster", "devtools", "plotly",
               "tensorflow", "reticulate","AtmChile",  "forecast", "rmarkdown", "tinytex", "XML")
  len <- length(librarys)

  for(i in 1:len){
    pkg<- librarys[i]
    print(paste(pkg, "in progress"))
    install.packages(pkg)
    print(paste(pkg, "finished"))
  }
}
tinytex::install_tinytex()
