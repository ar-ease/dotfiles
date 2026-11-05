# Neovim Shortcuts

Leader = `Space`. Only shows custom maps and the most useful LazyVim defaults.
Press `Space` and wait to see everything via which-key.

## Undo History

| Key | Action |
|---|---|
| `Space ux` | Undo list |
| `Space u2` | Go back 1 minute |
| `Space u6` | Go back 5 minutes |

## Windows, Tabs & Buffers

| Key | Action |
|---|---|
| `ss` / `sv` | Split horizontal / vertical |
| `sh` `sj` `sk` `sl` | Move between splits |
| `Ctrl-h/j/k/l` | Move between splits **and tmux panes** |
| `Alt-h/l` | Narrower / wider |
| `Alt-j/k` | Shorter / taller |
| `Tab` / `Shift-Tab` | Next / previous tab |
| `te` | New tab (`:tabedit`) |
| `tw` | Close tab |

## LSP & Diagnostics

| Key | Action |
|---|---|
| `gd` | Go to definition |
| `gr` | References |
| `gI` | Go to implementation |
| `gy` | Go to type definition |
| `K` | Hover docs |
| `Space ca` | Code action |
| `Space cr` | Rename symbol |
| `Space cf` | Format |
| `]]` / `[[` | Next / previous use of word under cursor |
| `Space jn` / `Space jN` | Next / previous diagnostic |
| `Space jj` | Show diagnostic float |
| `Space jh` | Toggle inlay hints |
| `Space uf` | Toggle format-on-save |

Inline diagnostics show their source and rule: `msg (eslint: no-unused-vars)`.

## Git

| Key | Action |
|---|---|
| `;c` | LazyGit |
| `Space go` | Open the commit that last changed this line (diff in new tab) |
| `Space gB` | Open file/line in browser (GitHub) |
| `Space gY` | Copy GitHub URL |
| `]h` / `[h` | Next / previous changed hunk |
| `Space ghp` | Preview hunk |
| `Space ghs` / `Space ghr` | Stage / reset hunk |
| `Space ghb` | Blame line |

### CodeDiff (VSCode-style diff)

| Command | Shows |
|---|---|
| `:CodeDiff` | Uncommitted changes with file tree |
| `:CodeDiff --staged` | Staged changes |
| `:CodeDiff HEAD~5` | Last 5 commits |
| `:CodeDiff main...` | Branch vs main (PR review) |
| `:CodeDiff pr 512` | A GitHub PR |

Inside CodeDiff only:

| Key | Action |
|---|---|
| `]c` / `[c` | Next / previous change |
| `]f` / `[f` | Next / previous file |
| `-` | Stage / unstage file |
| `S` / `U` | Stage all / unstage all |
| `Space hs` / `Space hu` | Stage / unstage hunk |
| `do` / `dp` | Take / push change from other side |
| `gf` | Open file in a normal tab |
| `Space b` | Toggle file tree |
| `q` | Close |

## Copilot (AI)

| Key | Action |
|---|---|
| `Ctrl-J` | Accept suggestion (insert) |
| `Space jy` | Toggle Copilot |
| `Space k` | Inline chat (Cmd+K style) — works on selection too |
| `Space ke` | Explain |
| `Space kf` | Quick fix |
| `Space kr` | Refactor |
| `Space ko` | Optimize |
| `Space kt` | Generate tests |
| `Space kd` | Add docs |
| `Space ks` | Security review |
| `Space kc` | Convert code |
| `Space ki` | Custom inline edit |
| `\1` | Toggle chat |
| `\2` | Chat prompt |
| `\3` | Explain code |

## Tests (neotest)

| Key | Action |
|---|---|
| `;tr` | Run nearest |
| `;tt` | Run file |
| `;tT` | Run all test files |
| `;tl` | Run last |
| `;tS` | Stop |
| `;ts` | Toggle summary |
| `;to` / `;tO` | Show output / toggle output panel |

## HTTP Requests (kulala, in `.http` files)

**How to enter:** there is no command; kulala loads when you open any `.http` file.

1. `:e test.http` (any name ending in `.http`)
2. Write a request (separate multiple requests with `###`):

   ```http
   GET https://httpbin.org/get
   Accept: application/json

   ###

   POST https://httpbin.org/post
   Content-Type: application/json

   { "name": "test" }
   ```

3. Put cursor inside a request and press `\r` — response opens in a split.

| Key | Action |
|---|---|
| `\r` | Send request |
| `\t` | Toggle headers / body |
| `\n` / `\N` | Next / previous request |

## Misc

| Key | Action |
|---|---|
| `Space ja` | Toggle auto-save |
| `Space mm` | Toggle minimap |
| `Space d` | Database UI (DBUI) |
| `Space l` | Lazy plugin manager |
## Files & Search

| Key | Action |
|---|---|
| `Space Space` | Find files |
| `;f` | Find files (filtered) |
| `;F` | Find ALL files (incl. ignored) |
| `;r` | Live grep |
| `;s` | Treesitter symbols |
| `;e` | Diagnostics list |
| `;;` | Resume last picker |
| `\\` | Buffers |
| `sf` | File browser at current file |
| `Space t` | Toggle NvimTree |
| `Space f` | Reveal current file in NvimTree |

## Editing

| Key | Action |
|---|---|
| `jk` | Escape (insert mode) |
| `Ctrl-a` | Select all |
| `+` / `-` | Increment / decrement number |
| `x` | Delete char without yanking |
| `Space jr` | Replace word under cursor (confirm each) |
| `Space jR` | Replace word under cursor (all) |
| `ys{motion}{char}` / `ds{char}` / `cs{old}{new}` | Add / delete / change surround |
| `Space w` | Save |
| `Space q` / `Space Q` | Quit / quit all |



## AI Agent Workflow (Claude Code + tmux)

| Key | Action |
|---|---|
| `Ctrl-\ a` | Open Claude Code in a right pane (same dir) |
| `Ctrl-h` / `Ctrl-l` | Jump between Neovim and the Claude pane |
| `Ctrl-\ m` | Zoom current pane (toggle) |

Loop: ask Claude → it edits files (Neovim auto-reloads on focus) → `:CodeDiff` to review → `;c` LazyGit to commit.
