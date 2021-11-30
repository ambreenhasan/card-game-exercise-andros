## Card Game Challenge for Andros

### How to run

`ruby card_game.rb`

### Set up

The game does not use any special libraries and was written with plain old Ruby objects. My ruby version is 2.7.1 on my local machine.

### Limitations

There are a few limitations to this implementation:

1. It always assumes there are five players and one dealer. The code is hardcoded to assume that too. We could easily expand it by having a way to pass in the number of players.
1. It always assumes that only two cards will be dealt and calculates the score based on that.
1. I'm not a huge card player so the calculation doesn't take into account the suit of the card (if that were to determine a higher score).
1. It doesn't keep a running track of the winners per game (no datastore).
1. Tests. Trying to keep things down to an hour, I was unable to add tests.
