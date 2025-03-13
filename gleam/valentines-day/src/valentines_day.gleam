pub type Approval {
  Yes
  No
  Maybe
}

pub type Cuisine {
  Korean
  Turkish
}

pub type Genre {
  Crime
  Romance
  Thriller
  Horror
}

pub type Activity {
  BoardGame
  Chill
  Movie(Genre)
  Restaurant(Cuisine)
  Walk(Int)
}

pub fn rate_activity(activity: Activity) -> Approval {
  case activity {
    BoardGame -> No
    Chill -> No
    Movie(g) if g == Romance -> Yes
    Movie(_) -> No
    Restaurant(c) if c == Korean -> Yes
    Restaurant(_) -> Maybe
    Walk(d) if d > 11 -> Yes
    Walk(d) if d > 6 -> Maybe
    Walk(_) -> No
  }
}
