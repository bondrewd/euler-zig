const std = @import("std");

pub fn solution(n: u64) u64 {
    var sum: u64 = 0;
    for (0..n) |i| {
        if ((i % 3 == 0) or (i % 5 == 0)) {
            sum += @as(u64, i);
        }
    }
    return sum;
}

test "validation" {
    try std.testing.expect(solution(10) == 23);
}
