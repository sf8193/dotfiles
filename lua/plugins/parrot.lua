return {
  "frankroeder/parrot.nvim",
  dependencies = { "ibhagwan/fzf-lua", "nvim-lua/plenary.nvim" },

  config = function()
    require("parrot").setup {
      -- Providers must be explicitly added to make them available.
      providers = {
        anthropic = {
          api_key = os.getenv("CLAUDE_TOKEN"),
        },
      },
      chat_confirm_delete = false,
      hooks = {
        CommitMsg = function(prt, params)
          local futils = require "parrot.file_utils"
          if futils.find_git_root() == "" then
            prt.logger.warning "Not in a git repository"
            return
          else
            local template = [[
          i want you to act as a commit message generator. i will provide you
          with information about the task and the prefix for the task code, and
          i would like you to generate an appropriate commit message using the
          conventional commit format. do not write any explanations or other
          words, just reply with the commit message.
          start with a short headline as summary but then list the individual
          changes that should be considered by this message:
          ]] .. vim.fn.system "git diff --no-color --no-ext-diff --staged"
            local model_obj = prt.get_model "command"
            prt.Prompt(params, prt.ui.Target.popup, model_obj, nil, template)
          end
        end,
        Debug = function(prt, params)
          local template = [[
        I want you to act as {{filetype}} expert.
        Review the following code, carefully examine it, and report potential
        bugs and edge cases alongside solutions to resolve them.
        Keep your explanation short and to the point:

        ```{{filetype}}
        {{multifilecontent}}
        ```

        Please look at the following section specifically:

        ```{{filetype}}
        {{selection}}
        ```
        ]]
          local model_obj = prt.get_model "command"
          prt.logger.info("Debugging selection with model: " .. model_obj.name)
          prt.ChatNew(params, template)
        end,
        DebugFile = function(prt, params)
          local template = [[
        I want you to act as {{filetype}} expert.
        Review the following code, carefully examine it, and report potential
        bugs and edge cases alongside solutions to resolve them.
        Keep your explanation short and to the point:

        ```{{filetype}}
        {{filecontent}}	
        ```

        Please look at the following section specifically:

        ```{{filetype}}
        {{selection}}
        ```
        ]]
          local model_obj = prt.get_model "command"
          prt.logger.info("Debugging selection with model: " .. model_obj.name)
          prt.ChatNew(params, template)
        end,
        RefactorFileSelection = function(prt, params)
          local template = [[
        I want you to act as {{filetype}} expert.
        Review the following code, carefully examine it, and show me
        ways it can be refactored to make it cleaner code.
        Keep your explanation short and to the point:

        ```{{filetype}}
        {{filecontent}}	
        ```

        Please look at the following section specifically:

        ```{{filetype}}
        {{selection}}
        ```
        ]]
          local model_obj = prt.get_model "command"
          prt.logger.info("Debugging selection with model: " .. model_obj.name)
          prt.ChatNew(params, template)
        end,
        RefactorFile = function(prt, params)
          local template = [[
        I want you to act as {{filetype}} expert.
        Review the following code, carefully examine it, and show me
        ways it can be refactored to make it cleaner code.
        Keep your explanation short and to the point:

        ```{{filetype}}
        {{filecontent}}	
        ```
        ]]
          local model_obj = prt.get_model "command"
          prt.logger.info("Debugging selection with model: " .. model_obj.name)
          prt.ChatNew(params, template)
        end,
        RefactorMulti = function(prt, params)
          local template = [[
        I want you to act as {{filetype}} expert.
        Review the following code, carefully examine it, and show me
        ways it can be refactored to make it cleaner code.
        Keep your explanation short and to the point:

        ```{{filetype}}
        {{multifilecontent}}
        ```

        Please look at the following section specifically:

        ```{{filetype}}
        {{selection}}
        ```
        ]]
          local model_obj = prt.get_model "command"
          prt.logger.info("Debugging selection with model: " .. model_obj.name)
          prt.ChatNew(params, template)
        end,
      },
    }
  end,
}
