-- CONFIG --

-- Blacklisted vehicle models
carblacklist = {
	"vigilante",
	"hydra",
	"buzzard",
	"avenger",
	"akula",
	"apc",
	"barrage",
	"caracara",
	"cargobob",
	"chernobog",
	"hunter",
	"insurgent",
	"starling",
	"lazer",
	"bombushka",
	"savage",
	"rhino",
	"khanjali",
	'APC',
    'Barracks',
    'Barracks2',
    'Barracks3',
    'Barrage',
    'Chernobog',
    'Crusader',
    'Halftrack',
    'Khanjali',
    'Rhino',
    'Scarab',
	'AlphaZ1',
    'Avenger',
    'Avenger2',
    'Besra',
    'Blimp',
    'blimp2',
    'Blimp3',
    'Bombushka',
    'Cargoplane',
    'Cuban800',
    'seashark3',
    'Duster',
    'Howard',
    'Hydra',
    'Jet',
    'Lazer',
    'Luxor',
    'Luxor2',
    'Mammatus',
    'Microlight',
    'Miljet',
    'Mogul',
    'Molotok',
    'Nimbus',
    'Nokota',
    'Pyro',
    'Rogue',
    'Seabreeze',
    'Shamal',
    'Starling',
    'Stunt',
    'Titan',
    'Tula',
    'Velum',
	'Akula',
    'Annihilator',
    'Buzzard',
    'Cargobob',
    'Cargobob2',
    'Cargobob3',
    'Cargobob4',
    'Frogger',
    'Frogger2',
    'Havok',
    'Hunter',
    'Savage',
    'Seasparrow',
    'Skylift',
    'Supervolito',
    'Supervolito2',
    'Swift',
    'Swift2',
    'Valkyrie',
    'Valkyrie2',
    'Volatus',
    'Velum2',
    'Vestra',
    'Volatol',
    'Striekforce',
    'Scarab2',
    'Scarab3',
    'Thruster',
	'Deluxo',
	'Avenger',
    'cargoplane',
	'CARGOPLANE',
    'luxor',
    'blimp2',
	'dump',
	'cerberus',
	'cerberus2',
	'cerberus3',
	'cutter',
	'apc',
	'technical',
	'technical2',
	'technical3',
	'blimp',
	'blimp2',
	'blimp3',
	'cargoplane',
	'freightcar',
	'freight',
	'tankercar',
	'metrotrain',
	'tanker2',
	'freighttrailer',
	'baletrailer',
	'armytrailer2',
	'armytanker',
	'armytrailer',
	'bruiser3',
	'bruiser2',
	'bruiser1',
	'bruiser',
	'minitank',
	'khanjali',	
	'handler',
	'mixer',
	'mixer2',
	'handler',
	'phantom',
	'phantom2',
	'phantom3',
    'Trailersmall2'
}

-- CODE --

Citizen.CreateThread(function()
	while true do
		Wait(300)

		playerPed = GetPlayerPed(-1)
		if playerPed then
			checkCar(GetVehiclePedIsIn(playerPed, false))

			x, y, z = table.unpack(GetEntityCoords(playerPed, true))
			for _, blacklistedCar in pairs(carblacklist) do
				checkCar(GetClosestVehicle(x, y, z, 100.0, GetHashKey(blacklistedCar), 70))
			end
		end
	end
end)

function checkCar(car)
	if car then
		carModel = GetEntityModel(car)
		carName = GetDisplayNameFromVehicleModel(carModel)

		if isCarBlacklisted(carModel) then
			_DeleteEntity(car)
			sendForbiddenMessage("Un cheater esta spawneando autos,=AntiCheat Tumberos= Borrando autos en 20 segundos...!")
		end
	end
end

function isCarBlacklisted(model)
	for _, blacklistedCar in pairs(carblacklist) do
		if model == GetHashKey(blacklistedCar) then
			return true
		end
	end

	return false
end