# Welcome to Railstory!

## Title: Railstory
### Team Members: Sarah Huang, Shawn Huang, Jonathan Sheu
### Demo Link: [railstory.herokuapp.com](railstory.herokuapp.com)

## Idea:
* A role-playing game where players can create and battle characters with other users and build up character stats such as elemental energy, strength, and magic points.

## Models and Description:

### Player:
* has name, email, and many Characters

### Character:
* has name, level, health, strength, magic level, and experience level
* can have many Beasts
* belongs to a Player

### Beast:
* has name, element type, light/dark type, and counter points
* belongs to a Character

## Features:
* Players can log in, make Characters, and use the Characters to battle other Player’s Characters
* Players can choose Element Types while battling to affect their total Battle Damage
* Characters can level up after gaining enough experience
* Players can heal their own Characters
* Characters can own Beasts like mini pets

## Division of Labor:
* Jonathan: Made Players and Characters models
* Shawn: Implemented battle mechanics and element attributes
* Sarah: Made Beast model

## Requirements:
* Our special gem was 'seed_dump', which helped us transfer custom characters created in Rails console to our seed file.



## Game Guide:

### Controller rules:
* Characters have Level, Health, Experience Points, Strength Points, and Magic Points.
* A Player can have multiple Characters under their account, and Characters belong to a Player.
* Beasts are like pets that tag along with your Characters, and they belong to a Character.
* You also have the ability to Heal your own damaged Characters to get them battle-ready again!

### Element rules:
* Every character has Fire, Water, Wind, and Earth energy, and these come into play at battle time.
* Water is strong against fire.
* Fire is strong against earth.
* Earth is strong against wind.
* Wind is strong against water.

### Battle rules:
* The attacking Character picks one of their elements (Fire, Water, Wind, Earth) to use to attack the opponent.
* A random element of the opponent is used to defend against the attacker.
* The damage dealt is calculated by the formula BASE_DAMAGE * ELEMENT_MULTIPLIER * RANDOM_MULTIPLIER.
* If the attacker's element is the victim's element weakness, then damage is 2x! (element multiplier = 2)
* The random chance multiplier simulates stochastic battle conditions. It ranges between +/* 30% per attack, so an attack might do between 70% and 130% of its base damage.
* After the attack, the attacking Character will gain 10 experience points!
* If the attacking Character reaches 100 EXP, it will level up, and EXP will reset to 0.
