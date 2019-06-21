------------------------------------------------
--- Discord Vehicle Whitelist, Made by FAXES ---
------------------------------------------------

--- Config ---

restrictedVehicles = {
{"zentorno", "akula", ""}, -- This relates to the first item in the roleList (Civ)
{"", "", ""}, -- Second item (Trusted Civ)
}

--- Code ---

AddEventHandler('playerSpawned', function()
    local src = source
    TriggerServerEvent("FaxDisVeh:CheckPermission", src)
end)

allowedList = {}

RegisterNetEvent("FaxDisVeh:CheckPermission:Return")
AddEventHandler("FaxDisVeh:CheckPermission:Return", function(allowedVehicles, error)
    if error then
        print("[FAX DISCORD VEHICLE WHITELIST ERROR] No Discord identifier was found! Permissions set to false")
    end
	allowedList = allowedVehicles
end)

local function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(400)

		local ped = PlayerPedId()
		local veh = nil

		if IsPedInAnyVehicle(ped, false) then
			veh = GetVehiclePedIsUsing(ped)
		else
			veh = GetVehiclePedIsTryingToEnter(ped)
		end
		
		if veh and DoesEntityExist(veh) then
			local model = GetEntityModel(veh)
			local driver = GetPedInVehicleSeat(veh, -1)
			-- Check if it has one of the restricted vehicles
			local endLoop = false
			requiredPerm = nil
			for i = 1, #restrictedVehicles do
				for j = 1, #restrictedVehicles[i] do
					if GetHashKey(restrictedVehicles[i][j]) == model then
						-- It requires a permission
						requiredPerm = i
						endLoop = true
						break
					end
				end
				if endLoop then
					break
				end
			end
			local hasPerm = false
			if not requiredPerm == nil then
				if has_value(allowedList, requiredPerm) then
					hasPerm = true
				end
			end
			-- If doesn't have permission, it's a restricted vehicle to them
			if not hasPerm then
				if driver == ped then
					for i = 1, #blacklistedVehicles do
						local restrictedVehicleModel = GetHashKey(blacklistedVehicles[i])
						if (model == restrictedVehicleModel) then
							ShowInfo("~r~Restricted Vehicle Model.")
							DeleteEntity(veh)
							ClearPedTasksImmediately(ped)
						end
					end
				end
			end
        end
        -- local src = source
        -- TriggerServerEvent("FaxDisVeh:CheckPermission", src)
    end
end)

--- Functions ---
function ShowInfo(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentSubstringPlayerName(text)
	DrawNotification(false, false)
end
function DeleteE(entity)
	Citizen.InvokeNative(0xAE3CBE5BF394C9C9, Citizen.PointerValueIntInitialized(entity))
end
