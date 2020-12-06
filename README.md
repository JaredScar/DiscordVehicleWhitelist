# DiscordVehiclesRestrict (DiscordVehicleWhitelist by FAXES)
## Continued Documentation
https://docs.badger.store/fivem-discord-scripts/discordvehiclesrestrict

## Discontinued Documentation
This is a Discord Vehicle Restriction script that restricts vehicles to certain roles with discord. This idea came about because of FAXES DiscordVehicleWhitelist. I have gotten permission from FAXES to add onto his script and make it possible to restrict vehicle use to only certain roles within Discord.

The permissions update every respawn for a player :)

### How to Install
--- (REQUIRED) MAKE SURE YOU SET UP IllusiveTea's discord_perms script which you can find here: https://forum.fivem.net/t/discord-roles-for-permissions-im-creative-i-know/233805
1. Download DiscordVehicleWhitelist
2. Extract the .zip and place the folder in your /resources/ of your Fivem server
3. Make sure you add “start DiscordVehicleWhitelist” in your server.cfg
4. Enjoy 

### Setup
1. The 1s must be replaced with IDs of the roles within your discord
2. The order of the roles need to match up with the restrictedVehicles list within the server.lua:
```
--- Config ---

--[[
	REPLACE THE '1's WITH YOUR DISCORD ROLES' IDs
]]
-- THESE NEED TO BE THE RESPECTIVE ROLE IDs OF YOUR DISCORD ROLES:
roleList = {
1, -- Civ
1, -- Trusted Civ
}
```

### Credits

@Faxes for all his awesome work and for allowing me permission to release this! :)
