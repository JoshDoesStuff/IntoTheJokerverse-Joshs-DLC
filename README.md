# Into-the-Jokerverse
A video game crossover themed mod

## How to contribute
- Create a file with your name and add it in the "VGRMod" directory
- Add your lua file path you want to load into the `VGRMod_branches` table
    - Note: this file needs to be returning your full list of jokers to register (i.e. their `SMODS.Joker:new()`). If you make jokers in individual .lua files, create a main lua file that compiles them into one, and add that into `VGRMod_branches`.
- Add your game tootip if it's not already there into `game_ref_list`. **IT IS REQUIRED** that your jokers have an appended tooltip stating the game where the joker is from, and if that game isn't in `game_ref_list` than you can add it in.
- Add any API you will be using or any code that would need to be ran together with other jokers into the section below. This is to avoid possible conflict between branches.
