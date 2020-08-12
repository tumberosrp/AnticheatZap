-- CONFIG --

-- Blacklisted weapons
weaponblacklist = {
	"WEAPON_RAILGUN",
    "WEAPON_HAMMER",
    "WEAPON_GOLFCLUB",
    "WEAPON_CROWBAR",
    "WEAPON_BOTTLE",
    "WEAPON_DAGGER",
    "WEAPON_HATCHET",
    "WEAPON_MACHETE",
    "WEAPON_PISTOL_MK2",
    "WEAPON_APPISTOL",
    "WEAPON_BALL",
    "WEAPON_MARKSMANPISTOL",
    "WEAPON_SMG_MK2",
    "WEAPON_ASSAULTSMG",
    "WEAPON_MG",
    "WEAPON_COMBATMG",
    "WEAPON_COMBATMG_MK2",
    "WEAPON_FLARE",
    "WEAPON_FLAREGUN",
    "WEAPON_GUSENBERG",
    "WEAPON_MACHINEPISTOL",
    "WEAPON_ASSAULTRIFLE_MK2",
    "WEAPON_CARBINERIFLE_MK2",
    "WEAPON_ADVANCEDRIFLE",
    "WEAPON_SPECIALCARBINE",
    "WEAPON_BULLPUPRIFLE",
    "WEAPON_COMPACTRIFLE",
    "WEAPON_ASSAULTSHOTGUN",
    "WEAPON_HEAVYSHOTGUN",
    "WEAPON_MUSKET",
    "WEAPON_HEAVYSNIPER",
    "WEAPON_DBSHOTGUN",
    "WEAPON_HEAVYSNIPER_MK2",
    "WEAPON_MARKSMANRIFLE",
    "WEAPON_GRENADELAUNCHER",
    "WEAPON_GRENADELAUNCHER_SMOKE",
    "WEAPON_STINGER",
    "WEAPON_FIREWORK",
    "WEAPON_HOMINGLAUNCHER",
    "WEAPON_GRENADE",
    "WEAPON_FLARE",
    "WEAPON_SNOWBALL",
    "WEAPON_STICKYBOMB",
    "WEAPON_PROXMINE",
    "WEAPON_DOUBLEACTION",
    "WEAPON_RAILGUN",
    "WEAPON_COMPACTLAUNCHER",
    "WEAPON_SNSPISTOL_MK2",
    "WEAPON_REVOLVER_MK2",
    "WEAPON_SPECIALCARBINE_MK2",
    "WEAPON_BULLPUPRIFLE_MK2",
    "WEAPON_PUMPSHOTGUN_MK2",
    "WEAPON_MARKSMANRIFLE_MK2",
    "WEAPON_DIGISCANNER",
    "WEAPON_RAYMINIGUN",
    "WEAPON_RAYCARBINE",
    "WEAPON_BZGAS",
    "WEAPON_MOLOTOV",
    "WEAPON_FIREEXTINGUISHER",
   
}

-- Don't allow any weapons at all (overrides the blacklist)
disableallweapons = false

-- CODE --

Citizen.CreateThread(function()
	while true do
		Wait(300)

		playerPed = GetPlayerPed(-1)
		if playerPed then
			nothing, weapon = GetCurrentPedWeapon(playerPed, true)

			if disableallweapons then
				RemoveAllPedWeapons(playerPed, true)
			else
				if isWeaponBlacklisted(weapon) then
					RemoveWeaponFromPed(playerPed, weapon)
					sendForbiddenMessage("=Anticheat Tumberos= Esta arma no esta permitida!")
				end
			end
		end
	end
end)

function isWeaponBlacklisted(model)
	for _, blacklistedWeapon in pairs(weaponblacklist) do
		if model == GetHashKey(blacklistedWeapon) then
			return true
		end
	end

	return false
end