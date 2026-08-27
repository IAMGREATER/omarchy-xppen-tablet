# XP-Pen Tablet Control for Omarchy & Hyprland

A lightweight, native Wayland controller, roller-wheel scroll translator, express button remapper, and multi-monitor display switcher for **XP-Pen Deco series** drawing tablets on **Omarchy / Hyprland**.

---

## Features

- **Roller Wheel Mouse Scrolling**: Intercepts the default hardware `Ctrl`+`+` / `Ctrl`+`-` zoom keystrokes from the rotary encoder and translates them into smooth vertical mouse scroll events (`REL_WHEEL`).
- **Interactive GTK4 / Libadwaita GUI Settings**:
  - Customize the roller wheel (Smooth Scrolling, Zoom, or Brush Size adjustment).
  - Invert wheel direction toggle.
  - Interactive Key Combo Recorder: Press any keys on your keyboard (e.g. `Ctrl + Shift + P`) to assign them to any express button.
- **Toggle Settings with Button 1**: Press the topmost express key once to open the configuration GUI; press it again to dismiss it.
- **Dynamic Multi-Monitor Display Switcher (Button 2)**:
  - Automatically queries active displays from Hyprland.
  - If 1 display (laptop screen) is attached, locks drawing to that screen.
  - If multiple displays are attached, cycles: `Laptop Screen` $\rightarrow$ `External 1` $\rightarrow$ `External 2` $\rightarrow$ `All Displays (Span)` $\rightarrow$ `Loop`.
  - Seamlessly adapts if monitors are plugged in or unplugged on the go.
- **Status Bar Integration**: Ships with a Quickshell status bar widget (`Panel.qml`) for the Omarchy status bar.
- **Zero Proprietary Drivers**: Runs entirely in user-space over Linux `evdev` and `uinput`.

---

## Compatibility

- **Hardware**: XP-Pen Deco 02 (`28bd:0803`), Deco 01, Deco 03, Deco Pro, and similar XP-Pen tablets.
- **Desktop**: Omarchy, Hyprland, and other Wayland compositors.
- **Dependencies**: Python 3, `python-gobject`, `gtk4`, `libadwaita` (preinstalled on Omarchy).

---

## Installation

### Method 1: Automatic Install Script
Clone this repository and run the install script:
```bash
git clone https://github.com/IAMGREATER/omarchy-xppen-tablet.git
cd omarchy-xppen-tablet
./install
```

### Method 2: As an Omarchy Shell Plugin
Clone directly into your Omarchy plugins directory:
```bash
git clone https://github.com/IAMGREATER/omarchy-xppen-tablet.git ~/.config/omarchy/plugins/omarchy-xppen-tablet
~/.config/omarchy/plugins/omarchy-xppen-tablet/install
omarchy-shell shell rescanPlugins
```

---

## Default Express Button Mapping

| Button | Position | Action | Shortcut / Behavior |
| :--- | :--- | :--- | :--- |
| **Button 1** | Topmost (above wheel) | **Toggle Settings GUI** | Opens/closes the settings interface |
| **Button 2** | Middle (above wheel) | **Cycle Displays** | Cycles through active monitors + Span |
| **Button 3** | Bottom of top 3 | **Save** | `Ctrl + S` |
| **Dial** | Center Roller Wheel | **Vertical Scroll** | Smooth mouse wheel up / down |
| **Button 4** | Top of bottom 3 | **Pen Tool** | `Ctrl + Shift + P` |
| **Button 5** | Middle of bottom 3 | **Highlighter Tool** | `Ctrl + Shift + H` |
| **Button 6** | Bottommost | **Eraser Tool** | `Ctrl + Shift + E` |

---

## Configuration

Settings are saved in `~/.config/xppen/config.json`. The daemon watches this file and hot-reloads changes in real time.

```json
{
  "monitors": {
    "auto_detect": true,
    "include_span_all": true
  },
  "wheel": {
    "enabled": true,
    "invert": false,
    "action": "scroll"
  },
  "buttons": {
    "button1": { "action": "open_config" },
    "button2": { "action": "cycle_monitor" },
    "button3": { "action": "key_combo", "keys": ["ctrl", "s"] },
    "button4": { "action": "key_combo", "keys": ["ctrl", "shift", "p"] },
    "button5": { "action": "key_combo", "keys": ["ctrl", "shift", "h"] },
    "button6": { "action": "key_combo", "keys": ["ctrl", "shift", "e"] }
  }
}
```

---

## License
MIT License.
