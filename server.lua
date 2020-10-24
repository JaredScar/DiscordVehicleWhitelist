------------------------------------------------
--- Discord Vehicle Whitelist, Made by FAXES ---
------------------------------------------------

--- Config ---

-- THESE NEED TO BE THE RESPECTIVE ROLE LABELS AS LABELED IN Badger_Discord_API:
roleList = {
"", -- Civ
"Trusted_Civ", -- Trusted Civ
"FAA_Heli", -- FAA Heli
"FAA_Comm", -- FAA Comm
"Donator_Vehicles", -- Donator Vehicles
"Player", -- Player
"Staff", -- Staff
"Personal_[Shared]", -- Personal [Shared]
"Personal", -- Personal
"Admin", -- Admin
"Owner", -- Owner
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
		local roleIDs = exports.Badger_Discord_API:GetDiscordRoles(src)
		if not (roleIDs == false) then
			for i = 1, #roleIDs do
				for j = 1, #roleList do
					if exports.Badger_Discord_API:CheckEqual(roleList[j], roleIDs[i]) then
						table.insert(allowedVehicles, j)
					end
				end
			end
		else
			print(GetPlayerName(src) .. " did not receive permissions because roles == false")
		end
    elseif identifierDiscord == nil then
		print("identifierDiscord == nil")
    end
	-- Trigger client event
	TriggerClientEvent("FaxDisVeh:CheckPermission:Return", src, allowedVehicles, true)
end)