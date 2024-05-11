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

vim.api.nvim_create_user_command("ToggleDarkLight", function(opts)
    if vim.o.background == "dark" then
        vim.o.background = "light"
    else
        vim.o.background = "dark"
    end
end, {})

vim.api.nvim_create_user_command("SwitchTestCode", function()
    local function splitPath(path)
        local parts = {}
        for part in string.gmatch(path, "([^%.]+)") do
            table.insert(parts, part)
        end
        return parts
    end

    local function isTestType(segment)
        return segment == "spec" or segment == "test" or segment == "e2e" or segment == "unit"
    end

    local function fileExists(path)
        return vim.fn.filereadable(path) == 1
    end

    local function findTestFile(baseName, extension)
        local testTypes = {"unit", "spec", "test", "e2e"}
        local dir = vim.fn.expand('%:p:h') .. '/'
        for _, testType in ipairs(testTypes) do
            local potentialTarget = dir .. baseName .. "." .. testType .. "." .. extension
            if  fileExists(potentialTarget) then
                return potentialTarget
            end
        end
        return nil
    end

    local function tryToSwitchToSourceFile(parts, extension)
        baseName = table.concat(parts, ".", 1, #parts - 2) -- Remove the test type
        local potentialSource = vim.fn.expand('%:p:h') .. '/' .. baseName .. "." .. extension
        if vim.fn.filereadable(potentialSource) == 1 then
            vim.cmd('e ' .. potentialSource)
            return
        end
    end

    local function tryToSwitchToTestFile(baseName, extension)
        local testFile = findTestFile(baseName, extension)
        if testFile then
            vim.cmd('e ' .. testFile)
            return
        end
    end

    -- Starts here
    local filename = vim.fn.expand('%:t')
    local parts = splitPath(filename)

    if #parts < 2 then
        print("File name format not recognized.")
        return
    end

    local baseName, extension = table.concat(parts, ".", 1, #parts - 1), parts[#parts]
    if isTestType(parts[#parts - 1]) then
        tryToSwitchToSourceFile(parts, extension)
    else
        tryToSwitchToTestFile(baseName, extension)
    end

    print("Matching file not found.")
end, {})


vim.api.nvim_create_user_command("ShowFilePathFromGitRoot", function()
  local file_path = vim.fn.expand('%:p') -- Get the full path of the current file
  local git_root = vim.fn.systemlist('git -C ' .. vim.fn.expand('%:p:h') .. ' rev-parse --show-toplevel')[1]
  if vim.v.shell_error == 0 then -- Check if the git command was successful
    local relative_path = file_path:sub(#git_root + 2) -- Calculate the relative path
    print(relative_path)
  else
    print('Not inside a Git repository.')
  end
end, {})

vim.api.nvim_create_user_command('FindVueFiles', function()
  -- Yank the current word under cursor
  vim.cmd('normal! "vyiw')
  -- Get the yanked word from register v
  local yanked_word = vim.fn.getreg('v')
  -- Find the root of the git repository
  local git_root = vim.fn.system('git rev-parse --show-toplevel'):gsub('\n', '')
  -- Prepare the git command to list files that match the pattern
  local git_cmd = 'git -C ' .. git_root .. ' ls-files | grep ' .. yanked_word .. '.vue'
  -- Execute the git command and capture the output
  local result = vim.fn.systemlist(git_cmd)
  if #result == 0 then
    print("No .vue files found matching: " .. yanked_word)
    return
  elseif #result == 1 then
    print("single result " .. result[1])
    -- Extract the file path from the result
    -- Assuming result is in the format "file_path:line_number:matched_text"
    local file_path = vim.split(result[1], ':')[1]
    -- Edit the file if only one match is found
    vim.cmd('edit ' .. git_root .. '/' .. file_path)
  end
  -- Adjusting for Telescope to display the matched files
  require('telescope.builtin').find_files({ cwd = git_root, search_dirs = {git_root}, default_text = yanked_word .. '.vue' })
end, {})

vim.api.nvim_create_user_command('FindVueUsages', function()
  -- Get the current file name without the path and extension
  local file_name = vim.fn.expand('%:t:r')
  -- If the file has a .vue extension, remove it from the file name (optional step based on extension presence)
  if vim.fn.expand('%:e') == 'vue' then
    file_name = vim.fn.expand('%:t:r')
  end
  -- Find the root of the git repository
  local git_root = vim.fn.system('git rev-parse --show-toplevel'):gsub('\n', '')
  -- Prepare the git grep command to find occurrences of <FileName
  local grep_pattern = "'<" .. file_name .. "'"
  local git_grep_cmd = 'git -C ' .. git_root .. ' grep -E ' .. grep_pattern .. ' -- ' .. git_root
  -- Execute the git grep command and capture the output
  local result = vim.fn.systemlist(git_grep_cmd)
  if #result == 0 then
    print("No instances found for: <" .. file_name)
    return
  end
  -- Display the results with Telescope
  require('telescope.builtin').grep_string({ search = "<" .. file_name, cwd = git_root })
end, {})

vim.api.nvim_create_user_command('LiveGrepCurrentWord', function()
    local telescope = require('telescope.builtin')
    local word = vim.fn.expand('<cword>')
    telescope.live_grep({ default_text = word })
end, {})

vim.api.nvim_create_user_command('GitFilesCurrentWord', function()
    local telescope = require('telescope.builtin')
    local word = vim.fn.expand('<cword>')
    telescope.git_files({ default_text = word })
end, {})

vim.api.nvim_create_user_command('Magit', function()
    LazyVim.terminal(
        { 'emacs', '-nw', '-eval', '(progn (magit-status) (delete-other-windows))' },
        { cwd = LazyVim.root() }
    )
end, {})
