import os
from subprocess import check_output

from libqtile.widget import base
from libqtile.command.base import expose_command

home = os.path.expanduser('~')
assets = os.path.join(home, '.assets')


class MicWidget(base.ThreadPoolText):
    """Widget that shows the microphone status."""

    defaults = [
        (
            "update_interval",
            30,
            "Update interval in seconds, if none, the widget updates only once.",
        ),
    ]
    last_status = None

    def __init__(self):
        base.ThreadPoolText.__init__(self, '')
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
                notify = f'notify-send --icon {assets}/mic-ready.svg -t 500 -u critical LIGADO!'
            else:
                notify = f'notify-send --icon {assets}/mic-off.svg -t 500 DESLIGADO!'
            self.qtile.spawn(notify)
            self._change_color(self._get_color(on))
        return '' if on else ''

    @expose_command()
    def toggle(self):
        stdout = check_output(['amixer', '-D', 'pulse', 'set', 'Capture', 'toggle'])
        str(stdout)  # Wait for the command to finish
        self.force_update()
