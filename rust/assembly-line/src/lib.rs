// This stub file contains items that aren't used yet; feel free to remove this module attribute
// to enable stricter warnings.
#![allow(unused)]

pub fn production_rate_per_hour(speed: u8) -> f64 {
    let total_cars = (speed as f64) * 221.0;
    match speed {
        5 ..=8 => (total_cars * 0.9),
        9 ..=10 => (total_cars * 0.77),
        _ => total_cars,
    }
}

pub fn working_items_per_minute(speed: u8) -> u32 {
    let per_hour = production_rate_per_hour(speed);
    return (per_hour / 60.0).floor() as u32;
}
