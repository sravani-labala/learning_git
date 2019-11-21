#------------function for generating the random board-------------------#

function display_board(){ 
  x=0
  for (y=0;y<side;y++) {
    for (j=0;j<side;j++) {
      printf " | "position[x]
      x++
    }
    print " |\n"
  }
  print "Press enter"
}

#-------------function for generating random numbers in the board-------------#

function random_numbers() {
  for (i=0;i<z;i++) {
    digit=int((rand()*(z+10)))+1
    numbers[i]=digit
  }
  # random_board()
}

#--------------function for checking the winner-----------------#

function win_check() {
  if (points_of_a == points_of_b) {
    print "both players got "points_of_a
    print " tie game"
  }
  else if (points_of_a > points_of_b) {
    print player_1" got "points_of_a
    print player_2" got " points_of_b 
    print player_1 " is the winner"
  } 
  else {
    print player_1" got "points_of_a
    print player_2" got "points_of_b
    print player_2 " is the winner"
  }
  exit
}

#-----------------function for checking the inputs equal to random value or not-------------#

function check_values() {
  points=0
  for (i=0;i<z;i++) {
    if (numbers[i]==value) {
      if (position[i]=="x"||position[i]=="o") {
        print "place is already occupied\n you missed your chance..."
        break
      }
      else {
        position[i]=a
        points=points+1
      }
    }
  }
}
#-------------begin blocks starts-----------------#

BEGIN {

  print "welcome to the game\n to know about the game press i\n to know about how to play press h\n to start the game press s"
  getline option
  if (option=="i") {
    about_game()
    start_the_game()
  }
  else if (option=="h") {
    how_to_play()
    start_the_game()
  }
  else if (option=="s") {
    start_the_game()
  }
  else {
    print "invalid input"
  } 
}

#-----------------main program------------------#

{
  if (turn==1) {
    print player_1 " it's your turn\n enter the value"
    getline value
    a="x"
    check_values()
    points_of_a=points_of_a+points
    turn=2
  }
  else {
    print player_2 " it's your turn\n enter the value"
    getline value
    a="o"
    check_values()
    points_of_b=points_of_b+points
    turn=1
  }
  display_board()
  total_spaces=total_spaces-points
  print "total spaces left = "total_spaces
  if (total_spaces == 0){
     win_check()
  }
}

#-----------------end block------------------#

END {
  print "come again and check your luck"
}


#-----------function to check the random numbers----------#

function random_board(){
  x=0
  for (y=0;y<side;y++) {
    for (j=0;j<side;j++) {
      printf " | "numbers[x]
      x++
    }
    print " |\n"
  }
}

#-----------function for knowing about the game-----------------#

function about_game() {
  print "This game requires two players. \n According to your selection of the value of x*x magic box, the empty magic box will appear.\nnow you need to guess the numbers from 1 to ((x*x)+10)\n for example if you have given 5 then the range of numbers can be from 1 to ((5*5)+10) ie., from 1 to 35\nSo you should enter the numbers from that range if that number is there in that magic box it will give you points according to the number of times it occurs in that box if not,your chance will be over and given to other player \nThe game will continue till all the places will be filled\nHope you like the game 🙂 \n Start playing\n"
}

#-------------function for knowing how to play------------#

function how_to_play() {
  print"The game is easy to play !\nEach player will get the chance alternatively\nAnd you should try your luck by entering the numbers between the range\nAnd at last when the box is filled , the points will be displayed for each player and winner will be declared\n"
}

#-----------function to start the game----------------#

function start_the_game() {
  print "enter the players names"
  getline player_1
  getline player_2
  print "enter the value for x*x magic box ie., from 3-9 only"
  getline side
  z=side*side
  range=z+10
  print "you can enter the values from 1 to " range
  display_board()
  srand()
  turn=1
  total_spaces=side*side
  random_numbers()
}

#It is a guessing game which requires two players. According to your side value, an empty side*side square will be generated. The range will be given basing on the side value, then each player should try to guess the value in the empty spaces of the box which was generated randomly by the computer. If all the spaces are filled then the game ends and declares the winner according to their scores.
