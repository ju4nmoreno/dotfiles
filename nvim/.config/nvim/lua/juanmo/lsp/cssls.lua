local cssls_status_ok, cssls = pcall(require, "cssls")
if not cssls_status_ok then
	return
end

cssls.setup{}
