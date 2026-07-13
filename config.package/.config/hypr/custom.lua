-- gen by confToLua.py
-- Source: 80-rules.conf
-- Some values might need MANUAL check. PLEASE DO BACKUP BEFORE TESTING, PLEASEEEE.

do
	local configDir = package.path:match("^(.-)%?%.lua")
	local list = io.popen('ls "' .. configDir .. 'hypr.d"/*.lua 2>/dev/null')
	if list then
		for file in list:lines() do
			local ok, err = pcall(dofile, file)
			if not ok then
				print("error loading " .. file .. ": " .. tostring(err))
			end
		end
		list:close()
	end
end
