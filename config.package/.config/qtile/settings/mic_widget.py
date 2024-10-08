import os
from subprocess import check_output

from libqtile.widget import base
from libqtile.command.base import expose_command

home = os.path.expanduser('~')
assets = os.path.join(home, '.assets')

UPDATE_INTERVAL = 30
NOTIFY_TIMEOUT = 1000

class MicWidget(base.ThreadPoolText):
    """Widget that shows the microphone status."""

    defaults = [
        (
            "update_interval",
            UPDATE_INTERVAL,
            "Update interval in seconds, if none, the widget updates only once.",
        ),
    ]
    last_status = None

    def __init__(self, **kwargs):
        base.ThreadPoolText.__init__(self, '', **kwargs)
        self.add_defaults(MicWidget.defaults)

    def _configure(self, qtile, bar):
        super()._configure(qtile, bar)
        self.update(self.poll())

    def _get_status(self):
        stdout = check_output(['amixer', 'get', 'Capture'])
        return '[on]' in str(stdout)

    def _get_color(self, status):
        return '#ff0000' if status else '#ffffff'

    def _change_color(self, color):
        self.foreground = color

    def poll(self):  # noqa
        on = self._get_status()
        if on != self.last_status:
            self.last_status = on
            if on:
                notify = f'notify-send --icon {assets}/mic-ready.svg -t {NOTIFY_TIMEOUT} -u critical MIC ON!'
            else:
                notify = f'notify-send --icon {assets}/mic-off.svg -t {NOTIFY_TIMEOUT} -u low MIC OFF!'
            self.qtile.spawn(notify)
            self._change_color(self._get_color(on))
        return ' 󰍬 ' if on else ' 󰍮 '

    def _action(self, action):
        stdout = check_output(['amixer', '-D', 'pulse', 'set', 'Capture', action])
        str(stdout)  # Wait for the command to finish
        self.force_update()


    @expose_command()
    def toggle(self):
        self._action('toggle')

    @expose_command()
    def power_on(self):
        self._action('cap')

    @expose_command()
    def power_off(self):
        self._action('nocap')
