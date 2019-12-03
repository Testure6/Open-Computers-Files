local Module = {}
local Term = require("term")
local Component = require("component")

Module.print = function(...)
  if not Term.isAvailable() then
    error("Terminal not available")
  end
  local Args = {...}
  local String = ""
  for i,v in pairs(Args) do
    if type(v) == "string" then
      if (#Args - i) > 1 then
        String = String..v..", "
      else
        String = String..v
      end
    else
      if (#Args - i) > 1 then
        String = String..tostring(v)..", "
      else
        String = String..tostring(v)
      end
    end
  end
  if String ~= "" then
    Term.write(String,true)
  end
end