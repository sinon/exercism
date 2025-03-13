// This stub file contains items that aren't used yet; feel free to remove this module attribute
// to enable stricter warnings.
#![allow(unused)]

pub struct Player {
    pub health: u32,
    pub mana: Option<u32>,
    pub level: u32,
}

impl Player {
    pub fn revive(&self) -> Option<Player> {
        if self.health == 0 {
            if self.level >= 10{
                Some(Player{health: 100, mana: Some(100), level: self.level})
            }
            else {
                Some(Player{health: 100, mana: self.mana, level: self.level})
            }
        } else {
            None
        }
    }

    pub fn cast_spell(&mut self, mana_cost: u32) -> u32 {
        return match self.mana {
            Some(i) => {
                match i >= mana_cost {
                    true => {
                        self.mana = Some(i - mana_cost);
                        mana_cost * 2
                    },
                    false => {
                        0
                    },
                }
            },
            None => {
                self.health = self.health.saturating_sub( mana_cost);
                0
            }
        }
    }
}
