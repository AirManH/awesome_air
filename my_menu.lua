-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

local my_menu = {}

local tool_menu = {
    {"File Manager", "nautilus"}
}

local awesome_menu = {
    {
        "hotkeys",
        function()
            hotkeys_popup.show_help(nil, awful.screen.focused())
        end
    },
    {"manual", terminal .. " -e man awesome"},
    {"edit config", editor_cmd .. " " .. awesome.conffile},
    {"restart", awesome.restart},
    {
        "quit",
        function()
            awesome.quit()
        end
    }
}

local network_menu = {
    {"qv2ray", 'env QT_SCREEN_SCALE_FACTORS="1.1;1" qv2ray'},
    {"chromium", "chromium"},
    {"firefox", "firefox"},
    {"firefox private", "firefox --private-window"}
}

local develop_menu = {
    {"Emacs", "emacs"},
    {"Zathura", "zathura"},
    {"VS Code", "code"},
    {"CLion", "clion"}
}

local other_menu = {
    {"deepin-wine-wechat", "/opt/apps/com.qq.weixin.deepin/files/run.sh"},
    {"Telegram", "telegram-desktop"},
    {"Nextcloud", "nextcloud"},
    {"Spotify", "spotify"},
    {"Baidu Net Disk", "/usr/lib/baidunetdisk/baidunetdisk"},
    {"Flame shot", "flameshot"},
    {"fcitx5-config-qt", "fcitx5-config-qt"},
    {"font-manager", "font-manager"}
}

my_menu.main_menu =
    awful.menu(
    {
        items = {
            {"Awesome", awesome_menu, beautiful.awesome_icon},
            {"Tools", tool_menu},
            {"Network", network_menu},
            {"Develop", develop_menu},
            {"Other", other_menu},
            {"Open Terminal", terminal}
        }
    }
)

return my_menu
