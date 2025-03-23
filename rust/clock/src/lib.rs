use std::fmt;

#[derive(Debug, PartialEq)]
pub struct Clock {
    hours: i32,
    minutes: i32,
}

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        let (hours_from_mins, remainder_mins) = (
            (minutes as f64 / 60.0).floor() as i32,
            minutes.rem_euclid(60),
        );
        let hours = (hours + hours_from_mins).rem_euclid(24);
        Clock {
            hours,
            minutes: remainder_mins,
        }
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        Clock::new(self.hours, self.minutes + minutes)
    }
}

impl fmt::Display for Clock {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{:02}:{:02}", self.hours, self.minutes)
    }
}
