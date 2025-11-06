-- Utility functions for Neovim configuration

local M = {}

-- Install lua language server manually
function M.install_lua_ls()
  local install_dir = vim.fn.stdpath('data') .. '/mason/bin'
  local url = 'https://github.com/LuaLS/lua-language-server/releases/download/3.15.0/lua-language-server-3.15.0-linux-x64.tar.gz'
  local temp_file = '/tmp/lua-language-server.tar.gz'
  
  -- Create install directory
  vim.fn.mkdir(install_dir, 'p')
  
  -- Download
  vim.fn.system({
    'wget', '-O', temp_file, url
  })
  
  -- Extract
  vim.fn.system({
    'tar', '-xzf', temp_file, '-C', install_dir, '--strip-components=1'
  })
  
  -- Clean up
  vim.fn.delete(temp_file)
  
  vim.notify('Lua Language Server installed successfully!', vim.log.levels.INFO)
end

return M