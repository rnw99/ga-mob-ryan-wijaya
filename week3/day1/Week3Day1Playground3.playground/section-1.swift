// Playground - noun: a place where people can play

import UIKit

/* Game has players
Game has player types:
    Good guys
    Bad guys
All players have 100 health to start with
Add different types of good guys and bad guys with their own special moves
Make it so players can only attack the opposite type (good can only attack bad and vice versa)
Default attack power to 20 points.
Attack status and player life is displayed on each attack.

Note: Instructors and TA’s to watch the teams to make sure that both students are comfortable embarking on the bonus content.

Bonus: Create a match class that starts a match and accepts a good  guy and a bad guy. Each player hits each other in turn until the other player is out of life.

Bonus 2: Make it so each attack does a random amount of damage between 0 and 20. If the attack does 0 damage, give the players feedback that the attack was blocked (give students hint: arcrandom_uniform method).
*/

class Player {
    var health: Int = 100
    
}

class GoodGuy : Player {
    func punch(opponent: BadGuy) {
        opponent.health -= 5
    }
    
    func stab(opponent: BadGuy) {
        opponent.health -= 25
    }
    
    func shoot(opponent: BadGuy) {
        opponent.health -= 50
    }
}


class BadGuy : Player {
    func punch(opponent: GoodGuy) {
        opponent.health -= 5
    }
    
    func stab(opponent: GoodGuy) {
        opponent.health -= 25
    }
    
    func shoot(opponent: GoodGuy) {
        opponent.health -= 50
    }
}

class Match {
    func start(goodGuy: GoodGuy, badGuy: BadGuy) {
        
    }
}

var skywalker = GoodGuy()
var maul = BadGuy()

func (skywalker: GoodGuy, maul: BadGuy) {
    
}



