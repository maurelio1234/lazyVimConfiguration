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

