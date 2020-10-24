------------------------------------------------
--- Discord Vehicle Whitelist, Made by FAXES ---
------------------------------------------------

--- Config ---
restrictedVehicles = {
{}, -- This relates to the first item in the roleList (Civ)
{
"x6m",
"rs7",
"hcbr2017",
"tmax",
"mst",
"lx570",
"gmcyd",
"cayenne",
"bbentayga",
"gtr",
"16challenger",
"adder",
"banshee2",
"bullet",
"cheetah",
"cyclone",
"entityXF",
"entity2",
"fmj",
"gp1",
"infernus",
"ItaliGTB",
"ItaliGTB2",
"nero",
"nero2",
"osiris",
"penetrator",
"pfister811",
"reaper",
"sc1",
"sultanRS",
"t20",
"taipan",
"tempesta",
"turismor",
"tyrus",
"vacca",
"visione",
"voltic",
"xa21",
"zentorno",
"14r8",
}, -- Second item (Trusted Civ)
{
"buzzard2",
"cargobob",
"cargobob2",
"cargobob3",
"cargobob4",
"frogger",
"frogger2",
"havok",
"maverick",
"polmav",
"seasparrow",
"skylift",
"supervolito",
"supervolito2",
"swift",
"swift2",
"volatus",
}, -- FAA Heli
{
"alphaz1",
"avenger",
"besra",
"cuban800",
"dodo",
"duster",
"howard",
"luxor",
"luxor2",
"mammatus",
"microlight",
"miljet",
"molotok",
"nimbus",
"seabreeze",
"shamal",
"mallard",
"titan",
"velum",
"velum2",
"vestra",
}, -- FAA Comm
{
"r8ppi",
"p1",
"urus",
"gsx150",
"ferporto",
"dbs2009",
"cb500x",
"cb500f",
"c7",
"lp700r",
"17m760i",
"f150",
"gt17",
"lp610",
"f82",
"mqgts",
"911turbos",
"bmwz4",
"chiron17",
"huracan",
"lp770r",
"gtrnismo17",
"sesto",
"370z",
"18velar",
"18SVR",
"rrst",
"458",
"audsq517",
"bmws",
"c63",
"contss18",
"fstradale",
"superleggera",
}, -- Donator Vehicles
{
"s500w222",
"r50",
"x5e53",
"wraith",
"subn",
"skyline",
"supra2",
"h6",
"gmt900escalade",
"g65amg",
"740i",
"16charger",
"benson3",
"prius",
"silvia3",
"356ac",
"crfsm",
"f15078",
"pobeda",
"r6",
"r25",
}, -- Player
{"2015polstang",}, -- Staff
{}, -- Personal [Shared]
{}, -- Personal [NOT SHARED]
{
"blazer5",
"technical",
"pounder2",
"oppressor2",
"menacer",
"monster",
"brutus",
"monster3",
"monster4",
"monster5",
"meneacer",
"marshall",
"insurgent3",
"insurgent2",
"insurgent",
"dune5",
"dune4",
"dune3",
"dune2",
"caracara",
"brutus3",
"brutus2",
"brutus1",
"bruiser3",
"bruiser2",
"bruiser",
"bralzer5",
"technical3",
"technical2",
"technical1",
"rcbandito",
"nightshark",
"bulldozer",
"molotok",
"seasparrow",
"hauler2",
"mule4",
"speedo4",
"hauler2",
"cutter",
"dump",
"handler",
"forklift",
"tractor",
"boxville2",
"boxville5",
"brickade",
"pbus2",
"rallytruck",
"wasterlander",
"phantom2",
"cerberus",
"cerberus2",
"cerberus3",
"issi3",
"issi4",
"issi5",
"issi6",
"cog552",
"limo2",
"clique",
"deviant",
"dominator4",
"dominator5",
"dominator6",
"prototipo",
"autarch",
"Le7b",
"deveste",
"sheava",
"tezeract",
"vagner",
"dukes2",
"impaler",
"impaler2",
"impaler3",
"impaler4",
"imperator",
"imperator2",
"imperator3",
"ruiner",
"toros",
"ruiner2",
"ruiner3",
"sabregt2",
"slamvan4",
"slamvan5",
"slamvan6",
"tampa3",
"tulip",
"vamos",
"ardent",
"deluxo",
"stromberg",
"italigto",
"kuruma2",
"revolter",
"schlagen",
"zr380",
"zr3802",
"zr3803",
"deathbike",
"deathbike2",
"deathbike3",
"oppressor",
"oprressor2",
"shotaro",
"avenger2",
"blimp",
"blimp2",
"blimp3",
"bombushka",
"cargoplane",
"hydra",
"jet",
"lazer",
"mogul",
"nokota",
"pyro",
"rogue",
"starling",
"strikeforce",
"tula",
"volatol",
"akula",
"annihilator",
"buzzard",
"hunter",
"savage",
"valkyrie",
"valkyrie2",
"submersible",
"submersible2",
"tug",
"policeold1",
"policeold2",
"vigilante",
"voltic2",
"scramjet",
}, -- Admin
{
"amggts",
"evoque",
}, -- Owner
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
			local requiredPerm = nil
			for i = 1, #restrictedVehicles do
				for j = 1, #restrictedVehicles[i] do
					if GetHashKey(restrictedVehicles[i][j]) == model then
						-- It requires a permission
						requiredPerm = i
						endLoop = true
						--TriggerEvent('chat:addMessage', {color = { 255, 0, 0}, multiline = true, args = {"Me", "Requires perm = " .. tostring(i)}}) -- TODO debug - get rid of
						break
					end
				end
				if endLoop then
					break
				end
			end
			local hasPerm = false
			if requiredPerm ~= nil then
				--TriggerEvent('chat:addMessage', {color = { 255, 0, 0}, multiline = true, args = {"Me", "RequiredPerm != nil"}}) -- TODO debug - get rid of
				if has_value(allowedList, requiredPerm) then
					--TriggerEvent('chat:addMessage', {color = { 255, 0, 0}, multiline = true, args = {"Me", "hasPerm = true"}}) -- TODO debug - get rid of
					hasPerm = true
				end
			end
			--TriggerEvent('chat:addMessage', {color = { 255, 0, 0}, multiline = true, args = {"Me", "Value of hasPerm = " .. tostring(hasPerm)}}) -- TODO debug - get rid of
			-- If doesn't have permission, it's a restricted vehicle to them
			if not hasPerm and (requiredPerm ~= nil) then
				if driver == ped then
					ShowInfo("~r~Restricted Vehicle Model.")
					DeleteEntity(veh)
					ClearPedTasksImmediately(ped)
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
