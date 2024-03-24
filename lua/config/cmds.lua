vim.api.nvim_create_user_command("TempBuffer", function(opts)
  -- Create a new buffer
  vim.cmd("enew")
  -- Set the buffer as a temporary buffer
  vim.bo.buftype = "nofile"
  vim.bo.bufhidden = "hide"
  vim.bo.swapfile = false
  -- Set the provided name as the buffer's name
  if opts.args ~= "" then
    vim.api.nvim_buf_set_name(0, opts.args)
  end
end, { nargs = "?" })
