local shell = require("shell")

if not require("filesystem").get("/").isReadOnly() then
  local r = io.open("/tmp/.root", "w")
   r:write("true")
    r:close()
else
  return
  io.stderr:write("filesystem is readonly")
end

shell.execute("/sbin/useradd.lua")
shell.execute("/sbin/userdel.lua root")
print("User root has been removed from the system, logging out.")
os.sleep(2.5)
shell.execute("logout")
