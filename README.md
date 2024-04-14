# game-jam-8

> Sumo-moaning
> A game about feeding moaning sumos.

game made for https://ldjam.com/events/ludum-dare/55

## Milestones
- [ ] ultra minimal mvp game loop
	- [X] add sumo, which runs from left and right
		- [X] make them eat the food; adjust score
	- [X] make time run out and show score 
	- [X] play test and finalize values - estimate: 30min - real:50?
		- 4 sumos was to much..and their walking speed 5 makes it easier
- [ ] create very basic art 2h ?
	- [ ] search for some inspo (time:15min)
	- [ ] background
	- [ ] "player" 12min/
	- [ ] one food
	- [ ] 1 sumo/ base with litte derivation
	- [ ] particle effects
- [ ] animate it and particle effects 1h
	- [ ] animate almost all interactions
	- [ ] add some particle effects
	- [ ] use the animation player to run animations and sfx at once
- [ ] polish the rest 1h
	- [ ] create a simple song and add it 
	- [ ] change font for all text and add margin

- [ ] add "tutorial loader"	 1h
- [ ] add start screen with sound adjustments
- [ ] submit before 00:00

## Bugs/Problems
- hitting two sumos with one food
	- the two sumos beeing joined together
- spawning two foods at once ?

## Ideas/Misc/Notes
- max score is 300.
- Maneki-neko/Lucky cat as food spawner
- add a "angry emporor" bar, which is the game over task
	- or add him on the second floor in the temple or so ?
	- or just add a limited number of food drops
- multiple foods types ? too much stuff in the jam...can be added if time 
- different food dropping speeds ? possible upgrades in future

---

## Folder structure

- game_world
	- contains all entities in the game world.
- main_scene
	- this scene is the main controller/root node, which loads each other scene and handles the data transfer between the scenes.
- UI
  - contains all UI scenes, which every game needs.
- assets
	- only for global assets, which arent used in an scene. Currently Fonts and Music.

## 
