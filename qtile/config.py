# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from typing import List  # noqa: F401
import os
import subprocess
from libqtile import bar, layout, widget 
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.command import lazy
from libqtile import hook
#from libqtile.utils import guess_terminal

mod = "mod4"
terminal = "alacritty"

keys = [
    # Switch between windows
    Key([mod], "h",
        lazy.layout.left(),
        desc="Move focus to left"),

    Key([mod], "l",
        lazy.layout.right(),
        desc="Move focus to right"),

    Key([mod], "j",
        lazy.layout.down(),
        desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(),
        desc="Move focus up"
        ),

    Key([mod], "space",
        lazy.layout.next(),
        desc="Move window focus to other window"),

    Key([mod], "f",
        lazy.window.toggle_fullscreen(),
        desc='toggle fullscreen'              ),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h",
        lazy.layout.shuffle_left(),
        desc="Move window to the left"),

    Key([mod, "shift"], "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    
    Key([mod, "shift"], "j",
        lazy.layout.shuffle_down(),
        desc="Move window down"),

    Key([mod, "shift"], "k",
        lazy.layout.shuffle_up(),
        desc="Move window up"),

    # Toggle between different layouts as defined below
    Key([mod], "Tab",
            lazy.next_layout(),
            desc="Toggle between layouts"),

    Key([mod], "q",
            lazy.window.kill(),
            desc="Kill focused window"),

    Key([mod, "control"], "r",
            lazy.restart(),
            desc="Restart Qtile"),

    ##shortcuts using alt + control

    Key([mod], "Return",
            lazy.spawn(terminal),
            desc="Launch terminal"),

    Key(["control", "mod1"], "c",
        lazy.spawn("chromium --incognito"),
        desc='private chromium'),

    Key(["control", "mod1"], "w",
        lazy.spawn("brave --incognito"),
        desc='private brave'),

    Key(["control", "mod1"], "l",
        lazy.spawn("slock"),
        desc='lock'),

    Key(["control", "mod1"], "e",
        lazy.spawn("dsession"),
        desc='dsession'),


    ##shortcuts using only mod key

    Key([mod], "d",
        lazy.spawn("rofi -show drun -theme ~/.config/rofi/rofi-collection/nord/nord.rasi"),
        desc='dmenu_run'),

    Key([mod], "w",
        lazy.spawn("brave"),
        desc='brave'),
 
    Key([mod], "c",
        lazy.spawn("chromium"),
        desc='chromium web'), 

    Key([mod], "x",
        lazy.spawn("clipmenu -i"),
        desc='clipboard manager'),

    Key([mod], "e",
        lazy.spawn("dmenuemoji"),
        desc='emoji picker'),

    Key([mod], "n",
        lazy.spawn("alacritty -e lf"),
        desc='file manager'),

    Key([mod, "shift"], "n",
        lazy.spawn("thunar"),
        desc='file manager'),

    Key([mod], "g",
        lazy.spawn("= --dmenu='dmenu -i -l 3'"),
        desc='calculator'),

    Key([mod], "t",
        lazy.spawn("alacritty -e tremc"),
        desc='torrent'),

    Key([mod], "r",
        lazy.spawn("alacritty -e newsboat"),
        desc='rss reader'),

    Key([mod], "p",
        lazy.spawn("keepmenu"),
        desc='keepmenu'),

    Key([mod], "slash",
        lazy.spawn("dunst-music-notification"),
        desc='packages to update'),


    ##shortcuts using mod + shift
    
    Key([mod, "shift"], "p",
        lazy.spawn("alacritty -t update  -e paru -Syu"),
        desc='update'),

    Key([mod, "shift"], "r",
        lazy.spawn("randomwall"),
        desc='randomwall'),


    Key([mod, "shift"], "k",
        lazy.spawn("/home/nabeel/.local/bin/pirokit"),
        desc='torrent'),

    Key([mod, "shift"], "w",
        lazy.spawn("dmenu-network"),
        desc='dmenu-network'),

    Key([mod, "shift"], "v",
        lazy.spawn("st -t set-bg  -e viewwalls"),
        desc='wallpaper-viewer'),

    Key([mod, "shift"], "slash",
        lazy.spawn("updatenotif"),
        desc='packages to update'),

    ##function keys

    Key([], "XF86AudioMute",
            lazy.spawn("pamixer -t")),

    Key([], "XF86AudioLowerVolume",
            lazy.spawn("pamixer --allow-boost -d 10")),

    Key([], "XF86AudioRaiseVolume",
            lazy.spawn("pamixer --allow-boost -i 10")),

    Key([], "XF86MonBrightnessUp",
            lazy.spawn("xbacklight -inc 15")),

    Key([], "XF86MonBrightnessDown",
            lazy.spawn("xbacklight -dec 15")),

    Key([], "Print",
            lazy.spawn("dmenu-screenshot"))

]

groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend([
        # mod + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i.name)),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        Key(["mod1"], i.name, lazy.window.togroup(i.name),
            desc="move focused window to group {}".format(i.name)),
    ])

layout_theme = {
        "border_width": 3,
        "border_focus": "#31748f",
        "border_normal": "#444444",
        "ratio": 0.5,
        "master_length": 1,
        "margin": 0,
        }

layouts = [
    layout.Tile(**layout_theme),
    layout.Max(**layout_theme),
    layout.Floating(**layout_theme),
    #layout.MonadWide(**layout_theme),
    #layout.MonadTall(**layout_theme),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    #layout.Columns(),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.RatioTile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]


widget_defaults = dict(
    font='UbuntuMono Nerd Font',
    fontsize=17,
    padding=7,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    active= "#e0def4",
                    #inactive= "#e0def4",
                    inactive= "#6e6a86",
                    padding= 10,
                    margin= 0,
                    highlight_method= "block",
                    ),

                #widget.WindowTabs(),
                
                widget.WindowName(
                    foreground= "#e0def4",
                    font="UbuntuMono Nerd Font",
                    fontsize="17",
                    ),

                widget.CurrentLayoutIcon(
                    custom_icon_paths = [os.path.expanduser("~/.config/qtile/icons")],
                    padding = 0,
                    scale = 0.5),
                
                widget.CurrentLayout(
                    foreground="#c4a7e7"
                    ),

                widget.TextBox(
                    text= "|",
                    ),

                #widget.Systray(),

                widget.CheckUpdates(
                colour_have_updates="#9ccfd8",
                colour_no_updates="#ebbcba",
                display_format="  {updates}"
                ),

                widget.TextBox(
                    text= "|",
                    ),

                widget.TextBox(
                    text="",
                    foreground="#eb6f92"
                    ),

                widget.ThermalSensor
                (foreground="#eb6f92"
                    ),

#                widget.TextBox(
#                    text= "|",
#                    ),
#
#                widget.TextBox(
#                    text="",
#                    foreground="#c4a7e7"
#                    ),
#
#                widget.KeyboardLayout(
#                     foreground="#c4a7e7",
#                     configured_keyboards= ['en','ar'],
#                     display_map= {'us':'EN'},
#                    ),
                
                widget.TextBox(
                    text= "|",
                    ),

                widget.Net(
                    interface= "wlan0",
                    format= " {down}",
                    foreground= "#ebbcba",
                    use_bits= True
                    ),

                widget.TextBox(
                    text= "|",
                    ),

                widget.Battery(
                    foreground= "#f6c177",
                    format="{char} {percent:2.0%}",
                    full_char= " ",
                    discharge_char= " ",
                    charge_char= "",
                    ),

                widget.TextBox(
                    text= "|",
                    ),

                widget.TextBox(
                    text= "",
                    foreground= "#9ccfd8"
                    ),

                widget.Backlight(
                    foreground= "#9ccfd8",
                    backlight_name= "intel_backlight",
                    ),
                
                widget.TextBox(
                    text= "|",
                    ),

                widget.TextBox(
                    text= "",
                    foreground= "#c4a7e7"
                    ),

                widget.Volume(
                    foreground= "#c4a7e7",
                    volume_app= 'pamixer'
                    ),

                widget.TextBox(
                    text= "|",
                    ),

                widget.Wlan(
                    format= "  {essid}",
                    foreground= "#eb6f92"
                    ),

                widget.TextBox(
                    text= "|",
                    ),

                 widget.Clock(
                    format= "  %a, %d-%m",
                    foreground= "#9ccfd8"
                    ),
                 
                widget.TextBox(
                    text= "|",
                    ),

                widget.Clock(
                    format= "  %I:%M",
                    foreground= "#f6c177"
                    ),
            ],
            35,
            background="#191724",
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
#main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='Blueman-manager'),
    Match(wm_class='Pavucontrol'),
    Match(wm_class='Gnomecast'),
])
auto_fullscreen = True
focus_on_window_activation = "smart"

#@hook.subscribe.startup_once
#def autostart():
#    home = os.path.expanduser('~/.config/qtile/autostart.sh')
#    subprocess.call([home])

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
