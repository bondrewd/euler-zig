const std = @import("std");
const math = std.math;

fn isPrime(n: u64) bool {
    if (n < 2) return false;
    if (n == 2) return true;
    if (n % 2 == 0) return false;

    var d: u64 = 3;
    while (d * d <= n) {
        if (n % d == 0) return false;
        d += 2;
    }

    return true;
}

pub fn solution(n: u64) u64 {
    var sum: u64 = 0;
    for (0..n) |i| {
        if (isPrime(i)) sum += i;
    }
    return sum;
}

test "isPrime" {
    try std.testing.expect(isPrime(2));
    try std.testing.expect(isPrime(3));
    try std.testing.expect(isPrime(5));
    try std.testing.expect(isPrime(7));
    try std.testing.expect(!isPrime(8));
}

test "validation" {
    try std.testing.expectEqual(17, solution(10));
}
