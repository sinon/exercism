const std = @import("std");
const mem = std.mem;

pub fn isBalanced(allocator: mem.Allocator, s: []const u8) !bool {
    if (s.len == 0) {
        return true;
    }
    var stack = std.ArrayList(u8).init(allocator);
    defer stack.deinit();
    for (s) |char| {
        switch (char) {
            '[', '{', '(' => try stack.append(char),
            ']', '}', ')' => {
                const peekCh = stack.getLastOrNull();
                if ((peekCh == '[' and char == ']') or (peekCh == '{' and char == '}') or (peekCh == '(' and char == ')')) {
                    _ = stack.pop();
                    continue;
                }
                return false;
            },
            else => continue,
        }
    }
    return stack.items.len == 0;
}
