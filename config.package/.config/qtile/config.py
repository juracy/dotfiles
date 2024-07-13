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

from collections import defaultdict
import os.path
import subprocess

from libqtile import bar, layout, qtile, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.log_utils import logger

from settings.mic_widget import MicWidget


mod = 'mod4'
terminal = 'kitty'
home = os.path.expanduser('~')
google_chrome_apps = {
    'teams': 'cifhbcnohmdccbgoicgdjpfamggdegmo',
    'bga': 'pogkokppkghfaeboimdkfifmcmlhngnl',
}

background = f'{home}/.assets/sunset.png'
apps = {
    'rofi': 'rofi -combi-modi window,drun -show combi -modi combi',
    'lock': f'i3lock -n --image {background}',
    'suspend': f'notify-send "suspending..." && i3lock --image {background} && sleep 2 && systemctl suspend -i',
    'screenshot': 'flameshot gui',
    'media_play': 'playerctl play-pause && notify-send "Play/pause" -t 1000',
    'media_next': 'playerctl next',
    'media_prev': 'playerctl previous',
    'volume_mute': 'pamixer -t',
    'volume_up': 'pamixer -u -i 5',
    'volume_down': 'pamixer -u -d 5',
    'terminal': terminal,
    'browser': 'google-chrome-stable',
    'editor': 'code',
    'teams': f'google-chrome-stable "--profile-directory=Profile 6" --app-id={google_chrome_apps["teams"]}',
    'whatsapp': 'flatpak run io.github.mimbrero.WhatsAppDesktop',
    'files': 'nautilus',
    'bga': f'google-chrome-stable --profile-directory=Default --app-id={google_chrome_apps["bga"]}',
    'mixer': 'pavucontrol',
    'kbcfg': 'setxkbmap -layout "br" -model pc105 -option "grp:menu_toggle,compose:sclk"',
    'wifi_on': 'nmcli radio wifi on',
    'wifi_off': 'nmcli radio wifi off',
    'calc': 'gnome-calculator',
    'logseq': 'logseq',
    'layout': f'{home}/.local/bin/layout_setup.sh auto',
    'layout-right-wide': f'{home}/.local/bin/layout_setup.sh right-wide',
}

pref_apps = defaultdict(
    lambda: f'notify-send "There isn''t app for this group: {qtile.current_group.name}"',
    {
        '1': apps['browser'],
        '2': apps['terminal'],
        '3': apps['editor'],
        '4': apps['whatsapp'],
        '5': apps['teams'],
        '6': apps['bga'],
        '7': apps['logseq'],
    },
)


@lazy.function
def run_preferred_app(qtile):
    app = pref_apps[qtile.current_group.name]
    logger.warning(f'Running: {app}')
    qtile.spawn(app)


@lazy.function
def window_to_previous_screen(qtile, switch_group=False, switch_screen=False):
    i = qtile.screens.index(qtile.current_screen)
    if i != 0:
        group = qtile.screens[i - 1].group.name
        qtile.current_window.togroup(group, switch_group=switch_group)
        if switch_screen:
            qtile.cmd_to_screen(i - 1)


@lazy.function
def window_to_next_screen(qtile, switch_group=False, switch_screen=False):
    i = qtile.screens.index(qtile.current_screen)
    if i + 1 != len(qtile.screens):
        group = qtile.screens[i + 1].group.name
        qtile.current_window.togroup(group, switch_group=switch_group)
        if switch_screen:
            qtile.cmd_to_screen(i + 1)


keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], 'h', lazy.layout.left(), desc='Move focus to left'),
    Key([mod], 'l', lazy.layout.right(), desc='Move focus to right'),
    Key([mod], 'j', lazy.layout.down(), desc='Move focus down'),
    Key([mod], 'k', lazy.layout.up(), desc='Move focus up'),
    Key([mod], 'space', lazy.layout.next(), desc='Move window focus to other window'),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key(
        [mod, 'shift'], 'h', lazy.layout.shuffle_left(), desc='Move window to the left'
    ),
    Key(
        [mod, 'shift'],
        'l',
        lazy.layout.shuffle_right(),
        desc='Move window to the right',
    ),
    Key([mod, 'shift'], 'j', lazy.layout.shuffle_down(), desc='Move window down'),
    Key([mod, 'shift'], 'k', lazy.layout.shuffle_up(), desc='Move window up'),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, 'control'], 'h', lazy.layout.grow_left(), desc='Grow window to the left'),
    Key(
        [mod, 'control'], 'l', lazy.layout.grow_right(), desc='Grow window to the right'
    ),
    Key([mod, 'control'], 'j', lazy.layout.grow_down(), desc='Grow window down'),
    Key([mod, 'control'], 'k', lazy.layout.grow_up(), desc='Grow window up'),
    Key([mod], 'n', lazy.layout.normalize(), desc='Reset all window sizes'),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, 'shift'],
        'Return',
        lazy.layout.toggle_split(),
        desc='Toggle between split and unsplit sides of stack',
    ),
    Key([mod], 'x', lazy.spawn(terminal), desc='Launch terminal'),
    # Toggle between different layouts as defined below
    Key([mod], 'Tab', lazy.next_layout(), desc='Toggle between layouts'),
    Key([mod], 'q', lazy.window.kill(), desc='Kill focused window'),
    Key(
        [mod],
        'f',
        lazy.window.toggle_fullscreen(),
        desc='Toggle fullscreen on the focused window',
    ),
    Key([mod], 't', run_preferred_app(), desc='run preferred app for window'),
    Key(
        [mod, 'control'],
        'space',
        lazy.window.toggle_floating(),
        desc='Toggle floating on the focused window',
    ),
    Key([mod, 'control'], 'r', lazy.reload_config(), desc='Reload the config'),
    Key([mod, 'control'], 'q', lazy.shutdown(), desc='Shutdown Qtile'),
    Key(
        [mod],
        'r',
        lazy.spawn(apps['rofi']),
        desc='Spawn a command using a prompt widget',
    ),
    Key(
        [],
        'XF86Search',
        lazy.spawn(apps['rofi']),
        desc='Spawn a command using a prompt widget',
    ),
    Key([mod], 'm', lazy.widget['micwidget'].toggle(), desc='Mic toggle'),
    Key([mod, 'control'], 'z', lazy.spawn(apps['wifi_on']), desc='Power on wifi'),
    Key([mod, 'control'], 'x', lazy.spawn(apps['wifi_off']), desc='Power off wifi'),
    # Personal
    # Fn keys: https://github.com/qtile/qtile/blob/master/libqtile/backend/x11/xkeysyms.py
    # Key([mod, 'control'], 'l', lazy.spawn(apps['suspend'], shell=True), desc='Suspender'),
    Key(
        [mod, 'control'],
        'm',
        lazy.spawn(apps['layout'], shell=True),
        desc='Configure layout',
    ),
    Key(
        [mod, 'control'],
        'n',
        lazy.spawn(apps['layout-right-wide'], shell=True),
        desc='Configure layout (right wide)',
    ),
    Key([], 'XF86Suspend', lazy.spawn(apps['suspend'], shell=True), desc='Suspend'),
    Key([mod], 'l', lazy.spawn(apps['lock']), desc='Lock the screen'),
    Key(
        [mod],
        'o',
        window_to_next_screen(switch_screen=True),
        desc='Move current window to another monitor',
    ),
    Key([], 'print', lazy.spawn(apps['screenshot']), desc='Screenshot'),
    Key([mod], 'print', lazy.spawn(apps['screenshot']), desc='Screenshot (alt)'),
    # Mídia e volume
    Key(
        [],
        'XF86AudioRaiseVolume',
        lazy.spawn(apps['volume_up']),
        desc='Raise up volume',
    ),
    Key(
        [],
        'XF86AudioLowerVolume',
        lazy.widget['volume'].decrease_vol(),
        desc='Lower down volume',
    ),
    # TODO: Implementar um find or run
    Key(
        [mod],
        'XF86AudioMute',
        lazy.spawn(apps['mixer']),
        desc='Load mixer',
    ),
    Key([], 'XF86AudioMute', lazy.spawn(apps['volume_mute']), desc='Mute volume'),
    Key(
        [],
        'XF86AudioPlay',
        lazy.spawn(apps['media_play'], shell=True),
        desc='Play/Pause the current player',
    ),
    Key(
        [],
        'XF86AudioPrev',
        lazy.spawn(apps['media_prev']),
        desc='Previous on the current player',
    ),
    Key(
        [],
        'XF86AudioNext',
        lazy.spawn(apps['media_next']),
        desc='Next on the current player',
    ),
    Key([mod], 'z', lazy.spawn(apps['kbcfg']), desc='Reset keyboard layout'),
    Key([mod], 'e', lazy.spawn(apps['files']), desc='File manager'),
    Key([], 'XF86Calculator', lazy.spawn(apps['calc']), desc='Calculator'),
]

# Add key bindings to switch VTs in Wayland.
# We can't check qtile.core.name in default config as it is loaded before qtile is started
# We therefore defer the check until the key binding is run by using .when(func=...)
for vt in range(1, 8):
    keys.append(
        Key(
            ['control', 'mod1'],
            f'f{vt}',
            lazy.core.change_vt(vt).when(func=lambda: qtile.core.name == 'wayland'),
            desc=f'Switch to VT{vt}',
        )
    )


groups = [Group(i) for i in '123456789']

for i in groups:
    keys.extend(
        [
            # mod1 + group number = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc='Switch to group {}'.format(i.name),
            ),
            # mod1 + shift + group number = switch to & move focused window to group
            Key(
                [mod, 'shift'],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc='Switch to & move focused window to group {}'.format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + group number = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

layouts = [
    layout.Columns(border_focus_stack=['#d75f5f', '#8f3d3d'], border_width=4),
    layout.VerticalTile(),
    layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font='Ubuntu',
    fontsize=16,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        wallpaper=background,
        wallpaper_mode='fill',
        top=bar.Bar(
            [
                widget.CurrentLayout(),
                widget.GroupBox(),
                widget.Prompt(),
                widget.WindowName(),
                widget.Chord(
                    chords_colors={
                        'launch': ('#ff0000', '#ffffff'),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
                # widget.StatusNotifier(),
                widget.Systray(),
                widget.Sep(),
                widget.BatteryIcon(
                    mouse_callbacks={
                        'Button1': lambda: qtile.cmd_spawn(
                            'notify-send "Bateria" "$(acpi -b)"', shell=True
                        ),
                    }
                ),
                # widget.Net(),
                widget.CPU(),
                widget.Sep(),
                widget.Memory(measure_mem='G'),
                widget.Sep(),
                widget.Notify(),
                widget.Clock(format='%Y-%m-%d %a %I:%M %p'),
                widget.Sep(),
                MicWidget(),
                widget.QuickExit(default_text='Sair'),
            ],
            24,
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
        # You can uncomment this variable if you see that on X11 floating resize/moving is laggy
        # By default we handle these events delayed to already improve performance, however your system might still be struggling
        # This variable is set to None (no cap) by default, but you can set it to 60 to indicate that you limit it to 60 events per second
        # x11_drag_polling_rate = 60,
    ),
    Screen(
        wallpaper=background,
        wallpaper_mode='fill',
        top=bar.Bar(
            [
                widget.CurrentLayout(),
                widget.GroupBox(),
                widget.Sep(),
                widget.TextBox('Secondary Screen'),
            ],
            24,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag(
        [mod],
        'Button1',
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], 'Button3', lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([mod], 'Button2', lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False


def popup_rules(window):
    # info = window.info()
    role = window.get_wm_role()
    wm_class = window.get_wm_class()
    is_google_chrome_app = [
        f'crx_{app}' in wm_class for app in google_chrome_apps.values()
    ]
    return role == 'pop-up' and not any(is_google_chrome_app)


floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class='confirmreset'),  # gitk
        Match(wm_class='makebranch'),  # gitk
        Match(wm_class='maketag'),  # gitk
        Match(wm_class='ssh-askpass'),  # ssh-askpass
        Match(wm_class='gtkperf'),  # GtkPerf
        Match(title='branchdialog'),  # gitk
        Match(title='pinentry'),  # GPG key password entry
        Match(func=popup_rules),  # Bitwarden
        Match(wm_class='Pavucontrol'),  # pavucontrol
        Match(wm_class='gnome-calculator'),  # gnome-calculator
    ]
)
auto_fullscreen = True
focus_on_window_activation = 'smart'
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = 'LG3D'


@hook.subscribe.startup_once
def autostart_once():
    subprocess.call(f'{home}/.config/qtile/autostart_once.sh')


@hook.subscribe.startup
def autostart():
    subprocess.call(f'{home}/.config/qtile/autostart.sh')


@hook.subscribe.client_new
def disable_floating(window):
    rules = [Match(wm_class='mpv')]

    if any(window.match(rule) for rule in rules):
        window.togroup(qtile.current_group.name)
        window.cmd_disable_floating()
