return {
  "Saghen/blink.cmp",
  config = function()
    require("blink.cmp").setup({
      sources = {
        default = { "go", "python", "lsp", "path", "snippets", "buffer", "markdown" },
        providers = {
          markdown = {
            name = "RenderMarkdown",
            module = "render-markdown.integ.blink",
            fallbacks = { "lsp" },
          },
        },
      },
    })
  end,
}
