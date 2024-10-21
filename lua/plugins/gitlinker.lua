return {
  'ruifm/gitlinker.nvim',
  dependencies = 'nvim-lua/plenary.nvim',
  opts = {
    callbacks = {
      ["git.blendlabs.com"] = function(url_data)
          local url = require"gitlinker.hosts".get_base_https_url(url_data) ..
            "/blob/" .. url_data.rev .. "/" .. url_data.file
          if url_data.lstart then
            url = url .. "#L" .. url_data.lstart
            if url_data.lend then url = url .. "-L" .. url_data.lend end
          end
          return url
        end
    }
  }
}
