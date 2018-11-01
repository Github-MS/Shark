#Total number of cells
TotalCells <- nrow(Design)
for (i in 1:TotalCells){
  Row <- i
  MyResult <- MySimulationCell(Design = Design, RowOfDesign = Row, K = 10 )
  # Write output of one cell of the design
  save(MyResult, file =paste("MyResult", "Row", Row,".Rdata" , sep =""))
}