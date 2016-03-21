# pacman-processing
##Description
I made a Pacman game duplicate with a pacman and dots that are eaten by the pacman when he passes over them. The player uses the arrow keys to control the pacman. There are no ghosts or lives because hard. A score keeper keeps track of how many dots are eaten. I tried hard to make a system that is extensible with multiple levels and objects instead of a program that only works with a single level.

##Motivation
I wanted to make something that was challenging to create, but also fun to make and interact with. Pacman is a classic game that presents a number of challenges, both in game play and creation, and it made of simple elements that can be made easily with Processing. Doing Pacman also lets me implement different levels of interaction and complexity depending on how much time I have.

##Process
Instead of making my level one large image, I divided it up into 14 50x50px sprites containing vertical/horizontal walls, caps, corners, and T shapes in 90 degree rotations. This lets me create levels programatically, and possibly even randomly following some rules if I was smart enough. Each 50x50 "Block" is it's own object, with overloaded constructors for Blocks that are not just vertical/horizontal walls (and one that's just a solid black color).

###Dot
The Dot object creates the small white circles that pacman eats. They have one field - isActive, which keeps track of whether the dot is eaten or not. The Dots get drawn after the level is drawn so I can check the color of the background pixels to determine whether I should place a dot there or not. Based on my 12x13 grid, I check a 10x10px block in the middle of every 50x50px Block to see if there's any blue (walls). I do 10x10 instead of 50x50 because each Block sprite will have blue somewhere in that area, and this is less expensive than checking 50x50. I had to hard code some areas that are straight black, but that pacman and dots cannot do: score area, enclosed areas.

###Level
A Level object contains 156 Blocks by default - a 12x12 grid with 1 row at the bottom for a score. It also contains just as many Dot objects, some of which are not active at start (not drawn) if they're inside a wall where pacman can't go. The Dots and Blocks are stored in two 2D arrays, and a method destroys the Dots as they're eaten and returns true/false to increase the score in the Pacman object if a dot is actually eaten.

###Pacman
The Pacman object creates my yellow pacman circle. I didn't implement sprites for pacman, but some of the code is there. This is also where collision detection happens. I have four methods for each direction he can move, and I check the color of the farmost middle pixel on the edge of the circle in the direction he's moving by tracking the coordinates of the middle of the circle and adding the radius value to x or y. If it's black or white, I keep moving. Then I check the X (if I'm going left or right) or Y (if up or down) value of pacman's coordinates to see if he's lying on my 50x50px grid between the walls of my wall Blocks. Because it's difficult to change directions on an exact pixel to stay on a grid (if I miss my turn I have to keep going), I added a +/-7px threshold. If I press a key to change directions within +/- 7px of my grid, then I allow this move and snap the pacman to the grid if he's in the threshold. I need him to snap so he's not running through walls all willy nilly. Back to my color detection: if that one pixel on the circle edge is not black or white (it's blue), then pacman stops because he's run into a wall or otherwise cannot move. I had to disable anti-aliasing in Processing because I'd have to detect more colors than b/w.

##Problems
It has an extremely low FPS, probably because I'm redrawing the entire level every frame... Drawing a single level means manually inputting 156 Blocks and their parameters.
