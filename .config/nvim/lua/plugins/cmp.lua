local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
    return
end

require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

--   פּ ﯟ   some other good icons
local kind_icons = {
    Text = "",
    Method = "m",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    mapping = {
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ["<C-e>"] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        },
        -- Accept currently selected item. If none selected, do nothing.
        ["<CR>"] = cmp.mapping.confirm { select = false },
        ["<C-k>"] = cmp.mapping(function(fallback)
            if luasnip.expandable() then
                luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif check_backspace() then
                fallback()
            else
                fallback()
            end
        end),
        ["<C-j>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end
        ),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
    },
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            -- Kind icons
            vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
            -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
            vim_item.menu = ({
                nvim_lsp = "(LSP)",
                luasnip = "(Snippet)",
                buffer = "(Text)",
                nvim_lsp_signature_help = "(Signature)",
                nvim_lua = "(Nvim LSP)",
                path = "(Path)",
            })[entry.source.name]
            return vim_item
        end,
    },
    sorting = {
        comparators = {
            cmp.config.compare.exact,
            cmp.config.compare.offset,
            cmp.config.compare.recently_used,
        }
    },
    sources = cmp.config.sources(
        {
            { name = "nvim_lsp",
                entry_filter = function(entry, context)
                    local kind = entry:get_kind()
                    local line = context.cursor_line
                    local col = context.cursor.col
                    local char_before_cursor = string.sub(line, col - 1, col - 1)

                    if char_before_cursor == "." then
                        if kind == 2 or kind == 5 then
                            return true
                        else return false end
                    elseif string.match(line, "^%s*%w*$") then
                        if kind == 3 or kind == 6 then
                            return true
                        else
                            return false
                        end
                    end
                    return true
                end

            },
            { name = 'nvim_lua' },
            { name = 'luasnip' },
            { name = 'nvim_lsp_signature_help' },
            { name = "path" },
        },
        {
            --This sources will only show up if there aren't any sources from the other list
            { name = "buffer", keyword_length = 5 },
        },
        {
            { name = "orgmode" }
        }
    ),
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },
    window = {
        documentation = cmp.config.window.bordered(),
        completion = cmp.config.window.bordered({
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None"
        })

    },
    experimental = {
        ghost_text = true,
        native_menu = false,
    },
}
