const std = @import("std");

pub fn solution(n: u64) u64 {
    var num: u64 = n;
    var ans: u64 = 1;
    var probe: u64 = 1;

    while (num != 1) {
        probe += 1;
        if (num % probe == 0) ans = probe;
        while (num % probe == 0) num /= probe;
    }
    return ans;
}

test "validation" {
    try std.testing.expect(solution(13195) == 29);
}
