
local emmetls_status_ok, emmetls = pcall(require, "cssls")
if not cssls_status_ok then
	return
end

emmetls.setup{}
