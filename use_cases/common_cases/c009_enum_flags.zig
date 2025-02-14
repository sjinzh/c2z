const std = @import("std");
const cpp = @import("cpp");

pub const ConfigFlags = extern struct {
    bits: c_int = 0,

    pub const FLAG_VSYNC_HINT: ConfigFlags = .{ .bits = @intCast(c_uint, 64) };
    pub const FLAG_FULLSCREEN_MODE: ConfigFlags = .{ .bits = @intCast(c_uint, 2) };
    pub const FLAG_WINDOW_RESIZABLE: ConfigFlags = .{ .bits = @intCast(c_uint, 4) };
    pub const FLAG_WINDOW_UNDECORATED: ConfigFlags = .{ .bits = @intCast(c_uint, 8) };
    pub const FLAG_WINDOW_HIDDEN: ConfigFlags = .{ .bits = @intCast(c_uint, 128) };
    pub const FLAG_WINDOW_MINIMIZED: ConfigFlags = .{ .bits = @intCast(c_uint, 512) };
    pub const FLAG_WINDOW_MAXIMIZED: ConfigFlags = .{ .bits = @intCast(c_uint, 1024) };
    pub const FLAG_WINDOW_UNFOCUSED: ConfigFlags = .{ .bits = @intCast(c_uint, 2048) };
    pub const FLAG_WINDOW_TOPMOST: ConfigFlags = .{ .bits = @intCast(c_uint, 4096) };
    pub const FLAG_WINDOW_ALWAYS_RUN: ConfigFlags = .{ .bits = @intCast(c_uint, 256) };
    pub const FLAG_WINDOW_TRANSPARENT: ConfigFlags = .{ .bits = @intCast(c_uint, 16) };
    pub const FLAG_WINDOW_HIGHDPI: ConfigFlags = .{ .bits = @intCast(c_uint, 8192) };
    pub const FLAG_WINDOW_MOUSE_PASSTHROUGH: ConfigFlags = .{ .bits = @intCast(c_uint, 16384) };
    pub const FLAG_MSAA_4X_HINT: ConfigFlags = .{ .bits = @intCast(c_uint, 32) };
    pub const FLAG_INTERLACED_HINT: ConfigFlags = .{ .bits = @intCast(c_uint, 65536) };

    pub usingnamespace cpp.FlagsMixin(ConfigFlags);
};

pub const ImGuiWindowFlags_ = extern struct {
    bits: c_int = 0,

    pub const None: ImGuiWindowFlags_ = .{ .bits = @intCast(c_uint, 0) };
    pub const NoTitleBar: ImGuiWindowFlags_ = .{ .bits = @intCast(c_uint, 1 << 0) };
    pub const NoResize: ImGuiWindowFlags_ = .{ .bits = @intCast(c_uint, 1 << 1) };
    pub const NoMove: ImGuiWindowFlags_ = .{ .bits = @intCast(c_uint, 1 << 2) };
    pub const NoScrollbar: ImGuiWindowFlags_ = .{ .bits = @intCast(c_uint, 1 << 3) };
    pub const NoScrollWithMouse: ImGuiWindowFlags_ = .{ .bits = @intCast(c_uint, 1 << 4) };
    pub const NoCollapse: ImGuiWindowFlags_ = .{ .bits = @intCast(c_uint, 1 << 5) };
    pub const AlwaysAutoResize: ImGuiWindowFlags_ = .{ .bits = @intCast(c_uint, 1 << 6) };
    pub const NoBackground: ImGuiWindowFlags_ = .{ .bits = @intCast(c_uint, 1 << 7) };
    pub const NoSavedSettings: ImGuiWindowFlags_ = .{ .bits = @intCast(c_uint, 1 << 8) };
    pub const NoMouseInputs: ImGuiWindowFlags_ = .{ .bits = @intCast(c_uint, 1 << 9) };
    pub const MenuBar: ImGuiWindowFlags_ = .{ .bits = @intCast(c_uint, 1 << 10) };
    pub const HorizontalScrollbar: ImGuiWindowFlags_ = .{ .bits = @intCast(c_uint, 1 << 11) };
    pub const NoFocusOnAppearing: ImGuiWindowFlags_ = .{ .bits = @intCast(c_uint, 1 << 12) };
    pub const NoBringToFrontOnFocus: ImGuiWindowFlags_ = .{ .bits = @intCast(c_uint, 1 << 13) };
    pub const AlwaysVerticalScrollbar: ImGuiWindowFlags_ = .{ .bits = @intCast(c_uint, 1 << 14) };
    pub const AlwaysHorizontalScrollbar: ImGuiWindowFlags_ = .{ .bits = @intCast(c_uint, 1 << 15) };
    pub const AlwaysUseWindowPadding: ImGuiWindowFlags_ = .{ .bits = @intCast(c_uint, 1 << 16) };
    pub const NoNavInputs: ImGuiWindowFlags_ = .{ .bits = @intCast(c_uint, 1 << 18) };
    pub const NoNavFocus: ImGuiWindowFlags_ = .{ .bits = @intCast(c_uint, 1 << 19) };
    pub const UnsavedDocument: ImGuiWindowFlags_ = .{ .bits = @intCast(c_uint, 1 << 20) };
    pub const NoDocking: ImGuiWindowFlags_ = .{ .bits = @intCast(c_uint, 1 << 21) };
    pub const NoNav: ImGuiWindowFlags_ = .{ .bits = @intCast(c_uint, ImGuiWindowFlags_.NoNavInputs.bits | ImGuiWindowFlags_.NoNavFocus.bits) };
    pub const NoDecoration: ImGuiWindowFlags_ = .{ .bits = @intCast(c_uint, ImGuiWindowFlags_.NoTitleBar.bits | ImGuiWindowFlags_.NoResize.bits | ImGuiWindowFlags_.NoScrollbar.bits | ImGuiWindowFlags_.NoCollapse.bits) };
    pub const NoInputs: ImGuiWindowFlags_ = .{ .bits = @intCast(c_uint, ImGuiWindowFlags_.NoMouseInputs.bits | ImGuiWindowFlags_.NoNavInputs.bits | ImGuiWindowFlags_.NoNavFocus.bits) };
    pub const NavFlattened: ImGuiWindowFlags_ = .{ .bits = @intCast(c_uint, 1 << 23) };
    pub const ChildWindow: ImGuiWindowFlags_ = .{ .bits = @intCast(c_uint, 1 << 24) };
    pub const Tooltip: ImGuiWindowFlags_ = .{ .bits = @intCast(c_uint, 1 << 25) };
    pub const Popup: ImGuiWindowFlags_ = .{ .bits = @intCast(c_uint, 1 << 26) };
    pub const Modal: ImGuiWindowFlags_ = .{ .bits = @intCast(c_uint, 1 << 27) };
    pub const ChildMenu: ImGuiWindowFlags_ = .{ .bits = @intCast(c_uint, 1 << 28) };
    pub const DockNodeHost: ImGuiWindowFlags_ = .{ .bits = @intCast(c_uint, 1 << 29) };

    pub usingnamespace cpp.FlagsMixin(ImGuiWindowFlags_);
};
