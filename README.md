# runoff — web version

Browser version of the Physical Board game. The ArUco camera and the Flask bridge
server are gone: players drag the 11 solution cards from the tray onto blocks.
Everything runs client-side, so this folder is a plain static site.

## Run locally

Double-click **`start.bat`**. It starts a local server and opens http://localhost:8000.

Or run it by hand:

```bash
cd Runoff_Web
python -m http.server 8000
```

Don't double-click `index.html`. Browsers block 3D model loading on `file://`, so level
select can't load (the page shows a warning if you do).

## How it differs from Physical_Board

| Physical board | Web |
|---|---|
| ArUco tokens 100–110 on block markers | Drag cards from the tray onto blocks (mouse or touch) |
| Flask `/api/state` polled every 400 ms | Local `boardState` in the page |
| Concept video loop at start | Animated water background behind a Play card |
| Game demo video | Text "How to play" card |
| Keyboard A / B / C | Buttons, Skip on context videos, ‹ › on level select. C / Enter / Space still advance, Esc goes home |
| Over-budget placement only warned | Drop is refused with the same warning |
| End screen auto-returns after 12 s | Try again / Choose another block / Home |

Moving a token: drag a card that's already placed onto a different block.
Removing a token: drop it back on the tray, or use ✕ on the card or in the summary list.

## Folder

```
index.html              the whole game (from Physical_Board/templates/board_view.html)
assets/models/          context_grid_exports (per-level block GLBs + full_model.glb), 145 MB
assets/video/           the 4 block context videos, renamed to URL-safe names, 110 MB
assets/img/             logos + map
```

## Hosting

It's a plain static site of 251 MB in total, and the largest file is 27 MB. It works on
Netlify, Vercel or GitHub Pages as is. Cloudflare Pages caps files at 25 MB, so the
context videos would need to be slightly smaller there.
