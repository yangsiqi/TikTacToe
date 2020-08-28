//Shelly Yang
//Array assignment: Tic Tac Toe
//Extra for Expert: Try to input the data from xml and use the data when filling the color of squares

Board drawBoard;
int state;
int colums,rows;
int winner;
XML xml;
float windSpeed;

void setup(){
  size(600,700);
  background(0);
  drawBoard = new Board();
  state = 1;
  colums = 3;
  rows = 3;
  drawBoard.setValue();
  
  //input xml data;
  xml = loadXML("weather.xml");
  
  XML forecast = xml.getChild("results/channel/yweather:wind");
  windSpeed = forecast.getInt("speed");
}

void draw(){
  if (state ==1){//Begin to play game
    chooseColor();
  }
  else if (state ==2 || state ==3){//Playing the game
    checkGame();
    checkWin();
    drawBoard.drawBoard();
  }
  else if (state ==4 ){//Game over
    ending();
  }
}


void mouseClicked(){
  if (state ==1){
    if (mouseX<width/2){//Left side is red
      state =2;
      
    }
    else if (mouseX>=width/2){//right side is blue
      state =3;
    }
  }
  
  else if (state ==2){//filling different color when click those squares
    checkGame();
    checkWin();
    LocateRed(mouseX,mouseY-100);
    state =3;
    }
  else if (state ==3){
    checkGame();
    checkWin();
    LocateBlue(mouseX,mouseY-100);
    state = 2;
  }
}

void keyPressed(){
  if (key == ENTER){//press enter to start again
    state = 1;
  }
  drawBoard = new Board();
}

void LocateRed(int x1, int y1){//fill red color
  int theX = int(x1/drawBoard.squareSize);
  int theY = int(y1/drawBoard.squareSize);
  
  if (drawBoard.board[theX][theY] == 0){
    drawBoard.board[theX][theY] =2;
  }
}

void LocateBlue(int x2, int y2){//fill blue color
  int whichX = int(x2/drawBoard.squareSize);
  int whichY = int(y2/drawBoard.squareSize);

  if (drawBoard.board[whichX][whichY] == 0){
    drawBoard.board[whichX][whichY] = 3;
  }
}

void checkWin(){
  for (int c = 0; c<= rows-1; c++){//check if three cells are the same color in the rows
    if (drawBoard.board[c][0] == 3 && drawBoard.board[c][1]== 3 && drawBoard.board[c][2]==3){
      winner = 3;
      state = 4;
    }
    else if (drawBoard.board[c][0] == 2 && drawBoard.board[c][1]==2&& drawBoard.board[c][2]==2){
      winner = 2;
      state = 4;
    }
  }
  
  for (int r = 0; r<= colums-1;r++){// check if three cells are the same color in colums
    if (drawBoard.board[0][r] ==3 && drawBoard.board[1][r] ==3 && drawBoard.board[2][r]==3 ){
      winner = 3;
      state = 4;
    }
    else if (drawBoard.board[0][r] ==2 && drawBoard.board[1][r] ==2 && drawBoard.board[2][r]==2 ){
      winner = 2;
      state = 4;
    }
  }
  
  //check the cells in the digonal line
  if (drawBoard.board[0][0] ==3&& drawBoard.board[1][1] ==3 && drawBoard.board[2][2] ==3){
    winner =3;
    state = 4;
  }
  else if (drawBoard.board[0][0] ==2 && drawBoard.board[1][1] ==2 && drawBoard.board[2][2] ==2){
    winner = 2;
    state = 4;
  }
  else if (drawBoard.board[2][0] ==3 && drawBoard.board[1][1] ==3 && drawBoard.board[0][2] ==3){
    winner = 3;
    state = 4;
  }
  else if (drawBoard.board[2][0] ==2 && drawBoard.board[1][1] ==2 && drawBoard.board[0][2] ==2){
    winner = 2;
    state = 4;
  }
}

void chooseColor(){
    stroke(255);
    line(width/2,0,width/2,height);
    noStroke();
    fill(255,0,0);
    rect(0,0,width/2,height);
    fill(0,0,255);
    rect(width/2,0,width,height);
    fill(0);
    rect(0,0,width,100);
    fill(255);
    textSize(30);
    text("Choose your color",width/2-105,50);
}


// check if the game is over by checking 9 squares
void checkGame(){
 int availableCell =0;
 for (int x= 0; x<=colums-1; x++){
   for (int y = 0; y<= rows-1; y++){
     if (drawBoard.board[x][y] ==0){
       availableCell ++;
     }
   }
 }
 if (availableCell ==0 && winner != 2 && winner !=3){
   state =4;
   winner =4;
    
 }
}


void ending(){
  background(0);
  if (winner == 2 ){
    textSize(30);
    fill(255,0,0);
    text("Red Player Win",width/2-80,height/2) ;
  }
  else if (winner ==3){
    textSize(30);
    fill(0,0,255);
    text("Blue Player Win",width/2-80,height/2) ;
  }
  else if (winner ==4){
    textSize(50);
    fill(255);
    text("Tie",width/2-50,height/2);
    
  }
  
 textSize(25);
 text("Press Enter to Start Again", width/2-140, height/2+60);
}
  
 