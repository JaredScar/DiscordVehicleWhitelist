------------------------------------------------
--- Discord Vehicle Whitelist, Made by FAXES ---
------------------------------------------------

--- Config ---

--[[
	REPLACE THE '1's WITH YOUR DISCORD ROLES' IDs
]]
-- THESE NEED TO BE THE RESPECTIVE ROLE IDs OF YOUR DISCORD ROLES:
roleList = {
1, -- Civ
1, -- Trusted Civ
}


--- Code ---

RegisterServerEvent("FaxDisVeh:CheckPermission")
AddEventHandler("FaxDisVeh:CheckPermission", function(_source)
    local src = source
	local allowedVehicles = {}
    for k, v in ipairs(GetPlayerIdentifiers(src)) do
        if string.sub(v, 1, string.len("discord:")) == "discord:" then
            identifierDiscord = v
        end
    end
	-- TriggerClientEvent("FaxDisVeh:CheckPermission:Return", src, true, false)
    if identifierDiscord then
		local roles = exports.discord_perms:GetRoles(src)
        for i = 1, #roles do
			for j = 1, #roleList do
				if roles[i] == roleList[j] then
					-- Return the index back to the Client script
					table.insert(allowedVehicles, j)
				end
			end
		end
    elseif identifierDiscord == nil then
		print("identifierDiscord == nil")
    end
	-- Trigger client event
	TriggerClientEvent("FaxDisVeh:CheckPermission:Return", src, allowedVehicles, true)
end)