#' login
#' @description a standard login function
#' @param user
#' @param pass
#'
#' @return
#' @export
#'
#' @examples
login<-function(user,pass){

  userVector<-c("Francisco", "Rafaella")
  passVector<-c("123456","123456")
  authentificationMatrix<-data.frame(userVector, passVector)
  aux<-length(userVector)
  check<-FALSE
  if(user ==""){
    check<-TRUE
    print("Insertar usuario")
  }
  i=1
  try(
    {
    while(check == FALSE){

      if(user == authentificationMatrix[1, i]){
        check<-TRUE
        checkPass<-FALSE
        j<-1
        try(
          {
          while(checkPass == FALSE){
            if(pass == authentificationMatrix[2,j]){
              checkPass<-TRUE
              return(TRUE)

            }
            j = j+1
          }
        }, silent = TRUE)
        if(checkPass == FALSE){
          print("Pass invalida")
          checkPass<-FALSE}
      }

      i=i+1
    }
  }, silent = T)


  if(check == FALSE){
    print("Usuario No Registrado")
    check<-FALSE}

}
