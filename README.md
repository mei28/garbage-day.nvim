# garbage-day.nvim
Garbage collector that stops inactive LSP clients to free RAM. 
 
## Why
I wrote this plugin for [NormalNvim](https://github.com/NormalNvim/NormalNvim), so we can have a LSP garbage collector that which code remains readable, maintainable, and stable without needing external dependencies.

## How to setup
Add this to lazy

```lua
{
  "zeioth/garbage-day.nvim",
  event = "BufEnter",
  opts = {
    grace_period = (60*15), -- after 15 min, stop LSP clients until resuming.
    excluded_languages = { "java" }, -- ignore languages whose clients miss behave.
    stop_invisible = true, -- LSP will remain active only for visible buffers.
  }
},
```

## Available options

| opt | default value | description |
|--|--|--|
| `grace_period` | 60*15 | Number of seconds to wait before stopping all LSP clients after neovim loses focus. |
| `excluded_languages` | { "java", "markdown" } | Languages whose lsp clients should never be stopped. Useful for lsp clients that miss behave. |
| `stop_invisible` | false | When true, every time you enter a buffer, all LSP clients except for the ones inside a window in the current tab will be temporary stopped. Enabling this feature will free a considerable amount of RAM when working with multiple filetypes. But this comes at the cost of higher CPU consumption, as the LSP client will start anew every time you enter a buffer with a different filetype than any of the ones in the windows of the current tab. Note that null-ls won't be stopped by this specific feature, as it is no compatible. |
| `notifications` | false | Once you check the this plugin works correctly, is a good idea to keep this option as false. |


## What's the deal with the cheesy name?
[It comes from the beloved meme](https://knowyourmeme.com/memes/garbage-day)

## FAQ

* It doesn't work: This plugin has been tested with neovim 0.9 and 0.10. If you are in a neovim version superior to nvim 0.10, and it doesn't work, please [open a issue tagging me](https://github.com/Zeioth/garbage-day.nvim/issues) and I will fix it.

## Other alternatives
* [lsp-timeout](https://github.com/hinell/lsp-timeout.nvim): Use it for nvim versions `<=0.8`.
