stds.nvim = {
  globals = {
    vim = { fields = { "g" } },
    table = { fields = { "unpack" } },
  },
  read_globals = {
    "vim",
    "jit",
  },
}
std = "lua51+nvim"

-- Rerun tests only if their modification time changed.
cache = true

-- vim: ft=lua sw=2 ts=2
