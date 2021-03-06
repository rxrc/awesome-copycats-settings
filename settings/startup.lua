-- {{{ Run once function

local awful = require("awful")

function run_once(cmd)
  findme = cmd
  firstspace = cmd:find(" ")
  if firstspace then
     findme = cmd:sub(0, firstspace-1)
  end
  awful.util.spawn_with_shell("pgrep -u $USER -x " .. findme .. " > /dev/null || (" .. cmd .. ")")
end

-- }}}


-- {{{ Autostart applications

awful.util.spawn_with_shell("sleep 1 && systemctl --user restart window-manager.target")

-- }}}
