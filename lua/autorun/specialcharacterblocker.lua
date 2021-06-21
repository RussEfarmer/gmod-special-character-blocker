local goodchars = {}
for i=32, 126 do
	goodchars[i] = utf8.char(i) end

function findSpecialChars(text)
	for i in text:gmatch(".") do
		catch = false
		for k,v in pairs(goodchars) do
			if v == i then catch = true end
		end
		if catch == false then return true end --Returns true if we should block text
	end
return false end

if SERVER then
	hook.Remove("PlayerSay", "nospecialchars")
	hook.Add( "PlayerSay", "nospecialchars", function(ply, text)
		if findSpecialChars(text) then return "" end
	end)
end
