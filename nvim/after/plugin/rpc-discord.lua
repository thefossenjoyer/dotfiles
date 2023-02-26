require("presence"):setup({
    workspace_text = function(git_project_name, buffer)
        local project_name = git_project_name
        if not git_project_name then
            project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
        end

        return string.format("Workspace: %s", project_name)
    end,

    log_level = nil,

     -- Rich Presence text options
    editing_text        = "Editing %s",             
    file_explorer_text  = "Browsing %s",            
    git_commit_text     = "Committing changes",     
    plugin_manager_text = "Managing plugins",       
    reading_text        = "Reading %s",             
    -- workspace_text      = "Working on %s",          
    line_number_text    = "Line %s out of %s",      
})
