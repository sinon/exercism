use std::fmt;

#[derive(Debug)]
#[derive(PartialEq)]
pub struct Clock {
    hours: i32,
    minutes: i32,
}

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        let (mut hours_from_mins, mut rem_mins) = (minutes / 60, minutes % 60);
        // if rem_mins < 0 {
        //     rem_mins = 60 - rem_mins;
        // }
        println!("{:?} {:?}", hours_from_mins, rem_mins);
        let hours_with_mins = hours + hours_from_mins;
        let res_hours = (hours_with_mins / 24, hours_with_mins.rem_euclid(24));
        println!("{:?}", res_hours);
        return Clock {hours: res_hours.1, minutes: rem_mins};
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        unimplemented!("Add {} minutes to existing Clock time", minutes);
    }
    pub fn to_string(&self) -> String {
        return format!("{self}");
    }
}

impl fmt::Display for Clock {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{:02}:{:02}", self.hours, self.minutes)
    }
}
