const std = @import("std");

fn digits(n: u64, list: *std.ArrayList(u64), allocator: std.mem.Allocator) anyerror!void {
    var num: u64 = n;
    while (true) {
        const d = num % 10;
        try list.append(allocator, d);
        num /= 10;
        if (num == 0) break;
    }
}

fn isPalindrome(n: u64, list: *std.ArrayList(u64), allocator: std.mem.Allocator) anyerror!bool {
    list.clearRetainingCapacity();
    try digits(n, list, allocator);

    const num_checks = list.items.len / 2;

    for (0..num_checks) |i| {
        const a = i;
        const b = list.items.len - 1 - i;
        if (list.items[a] != list.items[b]) return false;
    }

    return true;
}

pub fn solution(n: u64, allocator: std.mem.Allocator) u64 {
    var list: std.ArrayList(u64) = .empty;
    defer list.deinit(allocator);
    if (n == 0) unreachable;

    const lower = std.math.powi(u64, 10, n - 1) catch unreachable;
    const upper = std.math.powi(u64, 10, n) catch unreachable;

    var ans: u64 = 0;
    for (lower..upper) |i| {
        for (i..upper) |j| {
            const mul = i * j;
            if (isPalindrome(mul, &list, allocator) catch unreachable) {
                if (mul > ans) ans = mul;
            }
        }
    }
    return ans;
}

test "digits" {
    const gpa = std.testing.allocator;
    var list: std.ArrayList(u64) = .empty;
    defer list.deinit(gpa);

    try digits(0, &list, gpa);
    try std.testing.expect(list.items.len == 1);
    try std.testing.expect(list.items[0] == 0);
    list.clearRetainingCapacity();

    try digits(100, &list, gpa);
    try std.testing.expect(list.items.len == 3);
    try std.testing.expect(list.items[0] == 0);
    try std.testing.expect(list.items[1] == 0);
    try std.testing.expect(list.items[2] == 1);
    list.clearRetainingCapacity();
}

test "palindrome" {
    const gpa = std.testing.allocator;
    var list: std.ArrayList(u64) = .empty;
    defer list.deinit(gpa);

    try std.testing.expect(try isPalindrome(0, &list, gpa));
    try std.testing.expect(try isPalindrome(101, &list, gpa));
    try std.testing.expect(try isPalindrome(12344321, &list, gpa));
    try std.testing.expect(!try isPalindrome(12, &list, gpa));
}

test "validation" {
    const gpa = std.testing.allocator;
    try std.testing.expect(solution(2, gpa) == 9009);
}
