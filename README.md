<!----- Conversion time: 0.584 seconds.
Conversion notes:

* Docs to Markdown version 1.0β22
* Sat May 02 2020 13:06:47 GMT-0700 (PDT)
* Source doc: Game Design Document
----->



# The Halley Trail

## Game Design Document


### Goal

Create a 3D game set in space with gameplay styled after The Oregon Trail


### Overview

Use Godot to build a 3D game for CSCI 438 Final Project. 


### Game Description

The Halley Trail is a modeled after the classic hit game The Oregon Trail, where the player guides a wagon full of settlers from Independence, Missouri to Oregon. The game involves managing supplies to ensure settlers stay fed and healthy, navigating encounters with rivers or snakes or disease along the trail, stopping at forts to restock, hopefully making it to the end. In my game The Halley Trail, the player will lead a spaceship attempting to travel to Halley’s Comet in 2061 as it approaches earth at its orbit’s perihelion. The encounters along the path will be space themed - asteroid belts, alien ship encounters, tech malfunctioning, and the player’s success throughout these encounters will be determined by minigame style play. If time allows, each encounter will start with being presented options for a “choose your own adventure” style functionality. These options won’t change the fact that the encounter is happening, but rather modify some variables which impact potential risk and reward (e.g. if they choose to avoid the bulk of an asteroid belt, they navigate through fewer asteroids but it will take them longer, losing time they need to make it to the comet at the right moment)

The player will control the spaceship using the arrow keys in order to navigate obstacles, and in combat encounters will use the spacebar to shoot lasers. In the asteroid fields, rocks will be scattered throughout space, static or almost still (because the speed of the ship would far exceed the asteroids), and spinning randomly to add complexity. If the player collides with asteroids, the ship's health will be reduced. If the health decreases to 0, the player loses because their ship has been destroyed. However if they successfully maintain ship health through all encounters and obstacles, they will win when they reach Halley’s Comet. 


### Game Assets

- **Spacecraft:** A model of a spaceship, ideally could add an idle bobbing animation within the actual mesh

- **Asteroid:** A rock model which flies towards the ship, animation to rotate in a random direction/speed

- **Environment:** Infinite space skymap

- **Audio:** Spaceship flying noises, asteroid collision, encounter beginning/ending, maybe a background space theme music

- **Lighting:** The sun providing ambient lighting, and a directional light attached to the front of the ship

- **Planets:** Spherical models with varying textures to look like the planets stopped at on the way


### UI

The majority of the UI will be within a space skybox/environment node. Particles will be used to simulate some twinkling stars, and various planets or stars will be rendered when approached. There will be a HUD showing the current encounter, the time remaining before it has been passed, the ship’s name, and ship health.


### Game Object Mechanics


### States and Transitions

The initial state will be the introduction, where the story is explained and controls are disabled besides buttons to proceed. This state will have a few sub-states as they step through the story introduction, an input to set the name of the ship, and a brief tutorial for the controls. Once the user has clicked “proceed” through all of these, they will be shown a “begin” button which brings them to the gameplay state. In this state, an encounter notification will flash on the screen as it is triggered. If implemented, they will then be shown the options for how they want to handle the encounter, then once confirmed they will have a timer counting down how much time is left to navigate the encounter. In this state, the player has full controls for the ship - arrow keys allowing them to turn right/left, and pitch up/down (up/down keys inverted to more accurately simulate plane controls). When the encounter ends, the player will lose control and be shown statistics of how well they handled the encounter. After this, the encounter state will be triggered again (repeating until they reach a planet or the comet).


### Milestone Plan



- **Environment:** I want to make as realistic of a space environment as possible, initially this will just be a seamless panorama of stars but later I want to try to add particles so some stars seem to be twinkling
- **Ship and asteroid models:** I will be using assets from Kenney’s space kit to render these so adding them should be simple, just tweaking colors a bit and adding the right nodes to prepare for collisions
- **Player movement:** Add godot script to control the ship movement with keyboard inputs. Speed will not be adjustable (it’s space! You’re going too fast to adjust) but the direction will be able to turn smoothly in all directions (except backwards) following a point preceding the nose of the ship
- **HUD:** Add the labels and controls to initialize the game and display ship health during encounters
- **Asteroid spawning:** Since I’ll be building out just the asteroid belt encounter for now, this will need a timer which spawns asteroids at a given rate and renders them at randomized locations within a space ahead of the player. These will need to be removed when they go out of the field of view to avoid rendering too many.
- **Collision behavior:** Collision with asteroids will be detected and reduce the ships health
- **Encounter state management:** A timer will be added to determine when an encounter ends and also select the next encounter based on various probabilities of them happening. The player will be informed of the approaching encounter and then it will begin
- **Halley’s Comet:** Show the player approaching the comet as they reach the win state


### Tuning

Tune encounter probabilities, asteroid speeds, spawn rate, and rotation, player speed. Add better models for environment and objects. If time allows add supply handling and additional encounters. Add/update documentation in code and add documentation of gameplay to repository readme.


### Attributions



*   arrow keys by b farias from the Noun Project
*   Spaceship and asteroid models from Kenney’s Space Kit
*   Sun/planet/star image textures from Solar System Scope: [Solar Textures](https://www.solarsystemscope.com/textures/)

<!-- Docs to Markdown version 1.0β22 -->

## Story

Welcome to the future. After decades of venturing out into the great beyond, humanity decides they will attempt to build a colony on Europa. After years of researching how to reach this far off moon, scientists realized if a ship could make it to Halley's Comet, they could then hitch a ride through the galaxy.

Finally, it's July 28, 2061. The orbit of Halley's Comet is approaching perihelion for first time in 75 years, putting it within range of our best spaceships. You have been chosen as the captain on this voyage and are given a top of the line spacecraft to travel through the cosmos. You even get to christen it!

Your mission is as follows: pilot your ship to Halley's Comet as it passes near Earth, land on the icy surface, and hitch a ride to Jupiter's icy moon, Europa. Don't let your command be vaporized by asteroids!

## Controls

Use the arrow keys to control your ship's movement in the X and Y axes (you can't change your actual acceleration at light speed!). Dodge the asteroids so your crew can colonize the distant moon!

## Screenshots

!["begin" screen](https://i.imgur.com/HBj8lEf.png)

![summary screen](https://i.imgur.com/hnumCwG.png)

![naming screen](https://i.imgur.com/BsLVwmh.png)

![asteroid alert](https://i.imgur.com/PLik0Ud.png)

![dodging asteroids](https://i.imgur.com/joDn4pQ.png)

![asteroid collision](https://i.imgur.com/DIelrcB.png)

![lose screen](https://i.imgur.com/yLelk0m.png)

![win screen](https://i.imgur.com/k6s3Qcf.png)

## Future Goals

* Add more specific resource management (e.g. fuel, ammo, repairs, etc)

* Implement waypoints along the journey to Halley's Comet

* Implement more encounters (alien ships, system malfunctions, etc)

## Challenges

* To create the illusion of motion in the setup screens, originally I had the background rotating around the camera as it looked at the ship from a side view. However, this didn't work from a rear view (3/4) because the ship appeared to be spinning.

* Once I realized the rotating background wouldn't work consistently I got pretty hung up on how to handle the movement of the ship in a way that was aesthetically pleasing while still playable.

* Limiting the scope enough to actually work on legit features! I had a whole huge idea but because I got stuck on silly roadblocks, I ended up only getting to a few pieces of it. I'm determined to keep going on this project though.

## Credits

[Kenney](https://www.kenney.nl/): Assets (spaceship & asteroid models and textures)
