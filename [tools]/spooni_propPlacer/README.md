## spooni_propPlacer

Place persistent, client-only props in RedM using items. Players can preview with a translucent placement gizmo, confirm placement, and later remove props to get the item back. Props are streamed locally based on distance for performance and are persisted in a database.

### Features
- **Persistent props**: saved to MySQL and restored on resource start.
- **Client-only streaming**: non-networked entities spawn/despawn per-player within a radius.
- **Owner-only removal**: toggleable; pick up props nearby via a command and get the item back.
- **Limits**: per-item and global max per player.
- **Framework bridge**: VORP, RSG, or custom through a modular `frameworkBridge`.
- **Placement UX**:
  - Uses `gs_gizmo` if available for an intuitive gizmo experience.
  - Falls back to a simple translucent ghost you move/rotate before confirming.
- **Safe restarts**: cleans up client entities on stop/restart to prevent duplicates when reloading persisted props.

### Dependencies
- **Required**
  - `oxmysql` (database)
- **Supported frameworks**
  - VORP (`vorp_core`, `vorp_inventory`)
  - RSG (`rsg-core`)

- **Optional (enhanced placement)**
  - `gs_gizmo` for robust placement gizmo UX. See repo: [gs_gizmo](https://github.com/GlitchOo/gs_gizmo)

### Installation
- Drop this resource folder into your server’s `resources` directory (e.g., `resources/[spooni]/spooni_propPlacer`).
- Recommended start order in `server.cfg`:
  - `ensure oxmysql`
  - `ensure vorp_core` (or `ensure rsg-core`)
  - `ensure vorp_inventory` (if using VORP)
  - `ensure gs_gizmo` (optional)
  - `ensure spooni_propPlacer`
- The SQL table is auto-created on first start.

### Configuration
Edit `config/config.lua`.

- **Streaming**
  - `Config.StreamRadius`: load props within this distance
  - `Config.DespawnRadius`: unload beyond this distance
  - `Config.StreamCheckIntervalMs`: streaming tick interval
- **Removal**
  - `Config.RemoveCommand`: command to pick up a prop (default: `pickupprop`)
  - `Config.RemoveRadius`: how close you must be to a prop to remove it
  - `Config.AllowOwnerOnlyRemoval`: if true, only the owner can remove and receive the item
- **Limits**
  - `Config.MaxItemsPerPlayer`: global per-player placement cap
- **Items/Props**
  - Define `Config.Placeables` entries with:
    - `item`: inventory item name
    - `prop`: model name to spawn
    - `maxPerPlayer`: per-item cap
- **Gizmo defaults** (used by `gs_gizmo` if present and by fallback):
  - `EnableCam`, `MaxDistance`, `MaxCamDistance`, `MinY`, `MaxY`, `MovementSpeed`

Example snippet:
```lua
Config.StreamRadius = 120.0
Config.DespawnRadius = 140.0
Config.RemoveCommand = 'pickupprop'
Config.RemoveRadius = 2.5
Config.AllowOwnerOnlyRemoval = true
Config.MaxItemsPerPlayer = 10

Config.Placeables = {
  camp_chair = { item = 'campchair', prop = 'p_chair_10x', maxPerPlayer = 3 },
  small_crate = { item = 'smallcrate', prop = 'p_crate03x', maxPerPlayer = 5 },
}

Config.Gizmo = {
  EnableCam = true,
  MaxDistance = 30,
  MaxCamDistance = 40,
  MinY = -40,
  MaxY = 40,
  MovementSpeed = 0.15
}
```

### Usage
- **Place**
  - Use the configured inventory item.
  - Inventory closes; the placement gizmo opens (if `gs_gizmo` is running) or a translucent ghost appears.
  - Confirm placement to save and spawn the prop client-side.
- **Remove**
  - Stand near the prop and run `/pickupprop` (or your configured command).
  - The prop is removed, and the item is returned to your inventory.

### Persistence & Cleanup
- All props are persisted to the `prop_placer` table:
  - Columns: `id`, `owner_id`, `placeable_key`, `item_name`, `model`, `x`, `y`, `z`, `rx`, `ry`, `rz`, `created_at`
- On resource stop/restart:
  - The script instructs clients to delete local entities to avoid duplicates.
  - On start, props are loaded from DB and streamed back in cleanly when players are nearby.


### Controls (fallback placement)
- Move ghost by aiming the camera.
- Rotate with Q/E.
- Confirm with LMB, cancel with RMB.

### Troubleshooting
- Item not being removed:
  - Ensure `Config.Placeables[...]item` exactly matches your inventory item name.
  - Confirm `vorp_inventory` is running and supports `getItemCount`/`subItem`.
- Props not spawning:
  - Double-check model names are valid and loadable on RedM.
- Duplicates after restart:
  - Ensure the resource is not force-stopped mid-logic. The script already triggers client cleanup on stop/restart.

### Optional Gizmo Integration
This resource integrates automatically with `gs_gizmo` when that resource is running, providing a polished placement experience. See: [gs_gizmo](https://github.com/GlitchOo/gs_gizmo)

- The script passes `Config.Gizmo` into the `Toggle` export (EnableCam, MaxDistance, MaxCamDistance, MinY, MaxY, MovementSpeed).
- If `gs_gizmo` isn’t present, it falls back to the simpler ghost placement.

### Credits
- Placement gizmo integration: [gs_gizmo](https://github.com/GlitchOo/gs_gizmo)