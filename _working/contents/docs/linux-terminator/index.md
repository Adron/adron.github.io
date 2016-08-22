---
title: Terminator - Multiple GNOME terminals in one window
author: Adron Hall
date: 2016-07-18:07:18:01
template: doc.jade
---
**Options**

    -h, --help

Show summary of options
    
    -v, --version
    
Show the version of the Terminator installation

    -m, --maximise
    
Start with a maximised window

    -f, --fullscreen
    
Start with a fullscreen window

    -b, --borderless

Instruct the window manager not to render borders/decoration on the Terminator window (this works well with -m)

    -H, --hidden

Hide the Terminator window by default. Its visibility can be toggled with the hide_window keyboard shortcut (Ctrl-Shift-Alt-a by default)

    -T, --title

Force the Terminator window to use a specific name rather than updating it dynamically based on the wishes of the child shell.

    --geometry=GEOMETRY

Specifies the preferred size and position of Terminator's window; see x(7).

    -e, --command=COMMAND

Runs the specified command instead of your default shell or profile specified command

    -x, --execute COMMAND [ARGS]

Runs the rest of the command line instead of your default shell or profile specified command.

    --working-directory=DIR

Set the terminal's working directory

    -r, --role=ROLE

Set a custom WM_WINDOW_ROLE property on the window

    -l, --layout=LAYOUT

Start Terminator with a specific layout. The argument here is the name of a saved layout.

    -d, --debug

Enable debugging output (please use this when reporting bugs). This can be specified twice to enable a built-in python debugging server.

    --debug-classes=DEBUG_CLASSES

If this is specified as a comma separated list, debugging output will only be printed from the specified classes.

    --debug-methods=DEBUG_METHODS

If this is specified as a comma separated list, debugging outut will only be printed from the specified functions. If this is specified in addition to --debug-classes, only the intersection of the two lists will be displayed

**Keybindings**

The following keybindings can be used to control Terminator:

    Ctrl+Shift+O

Split terminals Horizontally.

    Ctrl+Shift+E

Split terminals Vertically.

    Ctrl+Shift+Right

Move parent dragbar Right.

    Ctrl+Shift+Left

Move parent dragbar Left.

    Ctrl+Shift+Up

Move parent dragbar Up.

    Ctrl+Shift+Down

Move parent dragbar Down.

    Ctrl+Shift+S

Hide/Show Scrollbar.

    Ctrl+Shift+F

Search within terminal scrollback

    Ctrl+Shift+N or Ctrl+Tab

Move to next terminal within the same tab, use Ctrl+PageDown to move to the next tab. If cycle_term_tab is False, cycle within the same tab will be disabled

    Ctrl+Shift+P or Ctrl+Shift+Tab

Move to previous terminal within the same tab, use Ctrl+PageUp to move to the previous tab. If cycle_term_tab is False, cycle within the same tab will be disabled

    Alt+Up

Move to the terminal above the current one.

    Alt+Down

Move to the terminal below the current one.

    Alt+Left

Move to the terminal left of the current one.

    Alt+Right

Move to the terminal right of the current one.

    Ctrl+Shift+C

Copy selected text to clipboard

    Ctrl+Shift+V

Paste clipboard text

    Ctrl+Shift+W

Close the current terminal.

    Ctrl+Shift+Q

Quits Terminator

    Ctrl+Shift+X

Toggle between showing all terminals and only showing the current one (maximise).

    Ctrl+Shift+Z

Toggle between showing all terminals and only showing a scaled version of the current one (zoom).

    Ctrl+Shift+T

Open new tab

    Ctrl+PageDown

Move to next Tab

    Ctrl+PageUp

Move to previous Tab

    Ctrl+Shift+PageDown

Swap tab position with next Tab

    Ctrl+Shift+PageUp

Swap tab position with previous Tab

    Ctrl+Plus (+)

Increase font size. Note: this may require you to press shift, depending on your keyboard

    Ctrl+Minus (-)

Decrease font size. Note: this may require you to press shift, depending on your keyboard

    Ctrl+Zero (0)

Restore font size to original setting.

    F11

Toggle fullscreen

    Ctrl+Shift+R

Reset terminal state

    Ctrl+Shift+G

Reset terminal state and clear window

    Super+g

Group all terminals so that any input sent to one of them, goes to all of them.

    Super+Shift+G

Remove grouping from all terminals.

    Super+t

Group all terminals in the current tab so input sent to one of them, goes to all terminals in the current tab.

    Super+Shift+T

Remove grouping from all terminals in the current tab.

    Ctrl+Shift+I

Open a new window (note: unlike in previous releases, this window is part of the same Terminator process)

    Super+i

Spawn a new Terminator process

**Drag and Drop**

The layout can be modified by moving terminals with Drag and Drop. To start dragging a terminal, click and hold on its titlebar. Alternatively, hold down Ctrl, click and hold the right mouse button. Then, **Release Ctrl**. You can now drag the terminal to the point in the layout you would like it to be. The zone where the terminal would be inserted will be highlighted.