return {
  "williamboman/mason.nvim",
  config = function()
    require("mason").setup({
      ui = {
        check_outdated_packages_on_open = true,
        border = "rounded",
      },
    })
  end,
}