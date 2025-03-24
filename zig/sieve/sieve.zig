const std = @import("std");

pub fn primes(buffer: []u32, limit: u32) []u32 {
    if (limit == 1) {
        return buffer[0..0];
    }
    if (limit <= 2) {
        buffer[0] = 2;
        return buffer[0..1];
    }
    var prime_candidates = [_]bool{true} ** 1000;
    prime_candidates[0] = false;
    prime_candidates[1] = false;
    var buffer_idx: usize = 0;
    for (0..prime_candidates.len) |num| {
        if (prime_candidates[num] == true) {
            if (num > limit) {
                break;
            }
            buffer[buffer_idx] = @as(u32, @intCast(num));
            buffer_idx += 1;
            var i = num * num;
            while (i <= limit) : (i += num) {
                if (i >= prime_candidates.len) {
                    break;
                }
                prime_candidates[i] = false;
            }
        }
    }
    return buffer[0..buffer_idx];
}
