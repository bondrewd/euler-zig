const std = @import("std");
const Io = std.Io;

const euler = @import("euler");

pub fn main(init: std.process.Init) !void {
    const gpa = init.gpa;
    // Accessing command line arguments:
    // const arena: std.mem.Allocator = init.arena.allocator();
    // const args = try init.minimal.args.toSlice(arena);
    // for (args) |arg| {
    // std.log.info("arg: {s}", .{arg});
    // }

    // In order to do I/O operations need an `Io` instance.
    const io = init.io;

    // Stdout is for the actual output of your application, for example if you
    // are implementing gzip, then only the compressed bytes should be sent to
    // stdout, not any debugging messages.
    var stdout_buffer: [1024]u8 = undefined;
    var stdout_file_writer: Io.File.Writer = .init(.stdout(), io, &stdout_buffer);
    const stdout_writer = &stdout_file_writer.interface;

    try stdout_writer.print("Problem 001: {d}\n", .{euler.@"001".solution(1_000)});
    try stdout_writer.print("Problem 002: {d}\n", .{euler.@"002".solution(4_000_000, gpa)});
    try stdout_writer.print("Problem 003: {d}\n", .{euler.@"003".solution(600_851_475_143)});
    try stdout_writer.print("Problem 004: {d}\n", .{euler.@"004".solution(3, gpa)});
    try stdout_writer.print("Problem 005: {d}\n", .{euler.@"005".solution(20, gpa)});
    try stdout_writer.print("Problem 006: {d}\n", .{euler.@"006".solution(100)});
    try stdout_writer.print("Problem 007: {d}\n", .{euler.@"007".solution(10_001)});
    try stdout_writer.print("Problem 008: {d}\n", .{euler.@"008".solution(13, gpa)});
    try stdout_writer.flush();
}
