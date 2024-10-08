return {
    {
        "williamboman/mason.nvim",
        opts = {}
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            html = {},
        },
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local lspconfig = require('lspconfig')

            -- Define the function for setting LSP keymaps
            local function lsp_keymap(client, bufnr)
                local bufopts = { noremap = true, silent = true, buffer = bufnr }
                vim.keymap.set('n', '<space>fr', vim.lsp.buf.format, bufopts)
                vim.keymap.set('n', '<space>d', vim.diagnostic.show, bufopts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
                vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
                vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
                vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
                vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
                vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
            end

            -- Setup LSP servers with the on_attach function
            lspconfig.html.setup({
                on_attach = lsp_keymap,
                capabilities = capabilities,
            })

            lspconfig.lua_ls.setup({
                on_attach = lsp_keymap
            })

            lspconfig.clangd.setup({
                on_attach = lsp_keymap,
                cmd = {
                    "clangd",
                    "--fallback-style=webkit"
                }
            })

            lspconfig.jdtls.setup({
                on_attach = lsp_keymap
            })

            lspconfig.tsserver.setup({
                on_attach = lsp_keymap,
            })


            lspconfig.cssls.setup({
                on_attach = lsp_keymap
            })

            lspconfig.rust_analyzer.setup({
                on_attach = lsp_keymap
            })

            lspconfig.intelephense.setup({
                on_attach = lsp_keymap
            })

            lspconfig.pyright.setup({
                on_attach = lsp_keymap
            })
            lspconfig.pylyzer.setup({
                on_attach = lsp_keymap
            })
        end
    }
}
