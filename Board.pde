class Board{
  //data
  int[][] board;
  int squareSize;
  int colums,rows;
  
  //constructor
  Board(){
    colums = 3;
    rows = 3;
    squareSize = width/3;
    
    
    board = new int[colums][rows];
  }
  
  //behavoir  
  void drawBoard(){
    background(0);
    for (int x= 0; x<=colums-1; x++){
      for (int y = 0; y<= rows-1; y++){
        stroke(0);
        strokeWeight(3);
        if (board[x][y] == 0){//cell is white before filling any color
          fill(255);
        }
        else if (board[x][y] ==2){//fill red
          fill(255,windSpeed*5,0);
        }
        else if (board[x][y] ==3 ){//fill blue
          fill(0,windSpeed*5,255);
        }
        
        rect(x*squareSize, y*squareSize+100,squareSize,squareSize,20);
      }
    }
    if (state ==2){
      textSize(30);
      fill(255,windSpeed*5,0);
      text("Red term",width/2-50,50);
    }
    else if (state ==3){
      textSize(30);
      fill(0,windSpeed*5,255);
      text("Blue term",width/2-50,50);
    }
  }
  
  void setValue(){
    for (int x= 0; x<=colums-1; x++){
      for (int y = 0; y<= rows-1; y++){
        board[x][y] = 0;
      }
    }
  }
  
  

}