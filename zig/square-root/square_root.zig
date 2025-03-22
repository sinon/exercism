const std = @import("../std.zig");
const round = @import("std").math.round;

pub fn squareRoot(radicand: usize) usize {
    // Herons Method
    const n: f64 = @floatFromInt(radicand);
    var prev: f64 = 1.0;
    var new: f64 = 0.5 * (1.0 + n);
    while (@abs(new - prev) > 0.00001) {
        prev = new;
        new = 0.5 * (new + n / new);
    }
    return @intFromFloat(round(new));
}
