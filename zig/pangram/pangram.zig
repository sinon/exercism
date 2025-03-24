const ascii = @import("std").ascii;

pub fn isPangram(str: []const u8) bool {
    for ('a'..'z') |char| {
        const c = @as(u8, @intCast(char));
        if (!(valueInArray(c, str) or valueInArray(ascii.toUpper(c), str))) {
            return false;
        }
    }
    return true;
}

fn valueInArray(value: u8, str: []const u8) bool {
    for (str) |num| {
        if (value == num) {
            return true;
        }
    }
    return false;
}
