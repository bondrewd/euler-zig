const std = @import("std");

fn fillWithFibonacci(n: u64, list: *std.ArrayList(u64), allocator: std.mem.Allocator) anyerror!void {
    if (n <= 1)
        return;

    var a: u64 = 0;
    var b: u64 = 1;

    while (true) {
        try list.append(allocator, b);
        const c = a + b;
        a = b;
        b = c;
        if (b >= n)
            break;
    }
}

pub fn solution(n: u64, allocator: std.mem.Allocator) u64 {
    var list: std.ArrayList(u64) = .empty;
    defer list.deinit(allocator);
    fillWithFibonacci(n, &list, allocator) catch unreachable;

    var sum: u64 = 0;
    for (list.items) |item| {
        if (item % 2 == 0) {
            sum += item;
        }
    }
    return sum;
}

test "validation" {
    const gpa = std.testing.allocator;
    try std.testing.expect(solution(90, gpa) == 44);
}
