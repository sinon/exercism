/// Given a list of poker hands, return a list of those hands which win.
///
/// Note the type signature: this function should return _the same_ reference to
/// the winning hand(s) as were passed in, not reconstructed strings which happen to be equal.
pub fn winning_hands<'a>(hands: &[&'a str]) -> Vec<&'a str> {
    let hands: Vec<Vec<Card<'_>>> = hands
        .iter()
        .map(|x| x.split(' ').map(Card::from_notation).collect::<Vec<_>>())
        .map(|x| {
            x.sort_unstable();
            x
        })
        .collect();
    println!("{hands:?}");
    // for hand in hands.iter() {
    //     for card in hand {
    //         let c = Card::from_notation(card);
    //         println!("{c:?}");
    //     }
    // }
    todo!("Out of {hands:?}, which hand wins?")
}

#[derive(Debug, PartialEq, Eq)]
enum Suit {
    Spades,
    Diamonds,
    Hearts,
    Clubs,
}

impl From<&str> for Suit {
    fn from(value: &str) -> Self {
        match value {
            "H" => Self::Hearts,
            "D" => Self::Diamonds,
            "S" => Self::Spades,
            "C" => Self::Clubs,
            _ => panic!("Unknown value:`{value}`"),
        }
    }
}

#[derive(PartialEq, PartialOrd, Debug, Eq, Ord)]
enum CardValue {
    Two,
    Three,
    Four,
    Five,
    Six,
    Seven,
    Eight,
    Nine,
    Ten,
    Jack,
    Queen,
    King,
    Ace,
}

impl From<&str> for CardValue {
    fn from(value: &str) -> Self {
        match value {
            "2" => Self::Two,
            "3" => Self::Three,
            "4" => Self::Four,
            "5" => Self::Five,
            "6" => Self::Six,
            "7" => Self::Seven,
            "8" => Self::Eight,
            "9" => Self::Nine,
            "10" => Self::Ten,
            "J" => Self::Jack,
            "Q" => Self::Queen,
            "K" => Self::King,
            "A" => Self::Ace,
            _ => panic!("Unknown card value: `{value}`"),
        }
    }
}

#[derive(Debug, PartialEq, PartialOrd)]
struct Card<'a> {
    suit: Suit,
    value: CardValue,
    original: &'a str,
}

impl<'a> Card<'a> {
    fn from_notation(notation: &'a str) -> Self {
        let (c_val, c_suit) = notation.split_at(notation.len() - 1);
        Card {
            suit: Suit::from(c_suit),
            value: CardValue::from(c_val),
            original: notation,
        }
    }
}

#[derive(Debug, PartialEq, PartialOrd, Eq, Ord)]
enum Hand {
    StraightFlush,
    FourOfAKind,
    FullHouse,
    Flush,
    Straight,
    ThreeOfKind,
    TwoPair,
    Pair,
    HighCard,
}

// impl From<Vec<Card>> for Hand {
//     fn from(value: Vec<Card>) -> Self {
//         todo!()
//     }
// }
