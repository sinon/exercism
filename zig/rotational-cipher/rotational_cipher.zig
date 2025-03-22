const mem = @import("std").mem;
const ascii = @import("std").ascii;

pub fn rotate(allocator: mem.Allocator, text: []const u8, shiftKey: u5) mem.Allocator.Error![]u8 {
    const cypher = try allocator.dupe(u8, text);
    for (cypher) |*c| {
        if (ascii.isAlphabetic(c.*)) {
            const first: u8 = if (ascii.isUpper(c.*)) 'A' else 'a';
            c.* = (c.* - first + shiftKey) % 26 + first;
        }
    }
    return cypher;
}
