const std = @import("std");

extern fn _Z6mallocy(_: c_ulonglong) ?*anyopaque;
pub const malloc = _Z6mallocy;

extern fn _Z4freePv(_: ?*anyopaque) void;
pub const free = _Z4freePv;

pub fn run() void {
    var a: ?*anyopaque = malloc(@intCast(c_ulonglong, 1));
    free(a);
}

pub const Foo = extern struct {
    ptr: [*c]c_int,

    pub fn init(self: *Foo, val: bool) bool {
        if (self.ptr == null) {
            self.ptr = @ptrCast([*c]c_int, malloc(@sizeOf(c_int)));
        }
        return !val;
    }

    pub fn inc(self: *Foo) void {
        self.init(true);
        //;
    }
};
