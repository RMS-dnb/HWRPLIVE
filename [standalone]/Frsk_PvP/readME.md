# Toggle PvP Script for RedM

## Description

This script allows players to toggle PvP (Player vs Player) combat on and off using a specified key. It also includes additional functionality to automatically enable PvP when a weapon is drawn or when the player receives damage.

## Features

- Toggle PvP on and off using the `J` key.
- Automatically enable PvP if a weapon is drawn.
- Automatically enable PvP if the player receives damage.
- Disables various combat-related controls when PvP is off.
- Provides visual feedback through a UI indicator.

## Installation

1. **Download the Script:**

   - Download or clone this repository to your local machine.

2. **Add to Your RedM Server:**

   - Place the `Frsk_PvP` folder into your RedM server's `resources` directory.

3. **Configure `server.cfg`:**
   - Add the following line to your `server.cfg` to ensure the script is loaded:
     ```plaintext
     start Frsk_PvP
     ```

## Usage

- **Toggle PvP:**

  - Press the `J` key to toggle PvP on and off.
  - A chat message will indicate whether PvP is enabled or disabled.
  - The UI indicator will change color to reflect the current PvP state.

- **Automatic Enabling of PvP:**
  - PvP will be automatically enabled if the player draws a weapon.
  - PvP will be automatically enabled if the player receives damage.

## Script Details

- **Controls Disabled When PvP is Off:**

  - Melee attack
  - Grapple attack
  - Grapple
  - Grapple choke
  - Weapon equipping (Tab key) // Player can still hold and then equip, doing so will enable pvp state
  - Left mouse button (primary attack)

- **UI Feedback:**
  - The script sends updates to a UI indicator to visually reflect the PvP state.

## Files and Structure

my_resource/
│
├── ui/
│ ├── index.html
│ ├── style.css
│ └── script.js
│
├── fxmanifest.lua
└── script.lua

- **`index.html`** - The HTML file for the UI indicator.
- **`style.css`** - The CSS file for the UI indicator styling.
- **`script.js`** - The JavaScript file for the UI indicator logic.
- **`fxmanifest.lua`** - The resource manifest file for the RedM server.
- **`script.lua`** - The main Lua script that handles the PvP toggle functionality.

## Customization

- **Toggle Key:**
  - Change the toggle key by modifying the `toggleKey` variable in `script.lua`.
  - Default: `J` key (0xF3830D8E).

## Support

If you encounter any issues or have questions, please feel free to open an issue in the repository or contact the script author.
