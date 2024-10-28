-- auto-format on save
-- local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	group = lsp_fmt_group,
-- 	callback = function()
-- 		local efm = vim.lsp.get_active_clients({ name = "efm" })
--
-- 		if vim.tbl_isempty(efm) then
-- 			return
-- 		end
--
-- 		vim.lsp.buf.format({ name = "efm", async = true })
-- 	end,
-- })

-- auto-format on save, but specific instructions for clang-format
local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
vim.api.nvim_create_autocmd("BufWritePre", {
    group = lsp_fmt_group,
    callback = function()
        local file_extension = vim.fn.expand("%:e")
        local clang_format_extensions = { "c", "cpp", "h", "hpp" }

        -- Check if the current file extension is in the list
        if vim.tbl_contains(clang_format_extensions, file_extension) then
            -- Path to the global .clang-format file
            local clang_format_file = vim.fn.expand('~/.config/clang-format/.clang-format')
            
            -- Format the file with clang-format
            vim.fn.jobstart(
                { 'clang-format', '--assume-filename=.clang-format', '--style=file:' .. clang_format_file, '-i', vim.fn.expand('%:p') },
                {
                    on_exit = function()
                        -- Reload the buffer after formatting
                        vim.schedule(function()
                            vim.cmd('edit')
                        end)
                    end,
                    stderr_buffered = true,
                    stdout_buffered = true,
                }
            )
        else
            -- Fallback to other formatters for non C/C++ files
            local efm = vim.lsp.get_active_clients({ name = "efm" })

            if vim.tbl_isempty(efm) then
                return
            end

            vim.lsp.buf.format({ name = "efm", async = true })
        end
    end,
})

-- highlight on yank
local highlight_yank_group = vim.api.nvim_create_augroup("HighlightYankGroup", {})
vim.api.nvim_create_autocmd("TextYankPost", {
	group = highlight_yank_group,
	callback = function()
