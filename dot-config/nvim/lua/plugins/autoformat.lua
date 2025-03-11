-- Autoformat
return {
  'stevearc/conform.nvim',
  opts = {
    log_level = vim.log.levels.DEBUG,
    notify_on_error = true,
    notify_no_formatters = true,
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
    lang_to_ext = {
      sh = 'zsh',
      c_sharp = 'cs',
      javascript = 'js',
      markdown = 'md',
      python = 'py',
      rust = 'rs',
      c = 'c',
      zig = 'zig',
    },
    lang_to_formatters = {},
    formatters_by_ft = {
      lua = { 'stylua' },
      c = { 'clang-format' },
      sh = { 'beautysh' },
      py = { 'blue' },
      zig = { 'zig_fmt' },
      yaml = { 'yq' },
      json = { 'jq' },
      cs = { 'cs_fmt' },
      css = { 'css_fmt' },
      toml = { 'taplo' },
      ['_'] = { 'trim_whitespace' },
    },
    formatters = {
      css_fmt = {
        command = 'css-beautify',
      },
      cs_fmt = {
        command = 'dotnet',
        prepend_args = { 'csharpier' },
      },
      zig_fmt = {
        command = 'zig',
        prepend_args = { 'fmt' },
        inherit = false,
      },
    },
  },
}
