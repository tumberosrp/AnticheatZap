Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0) -- Previene crasheo

		-- Estos nativos deben llamarse en todos los marcos.
		SetPedDensityMultiplierThisFrame(0.1) -- NPC = 0
		SetRandomVehicleDensityMultiplierThisFrame(0.1) -- Cars = 0
		SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0) -- Peds = 0
		SetVehicleModelIsSuppressed(GetHashKey("rubble"), true)
        SetVehicleModelIsSuppressed(GetHashKey("taco"), true)
        SetVehicleModelIsSuppressed(GetHashKey("biff"), true)
		SetCreateRandomCops(false) -- Random policias = 0
		SetCreateRandomCopsNotOnScenarios(false) -- Random policias = 0
		SetCreateRandomCopsOnScenarios(false) -- Random policias = 0
		
		local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
		ClearAreaOfVehicles(x, y, z, 1000, false, false, false, false, false)
		RemoveVehiclesFromGeneratorsInArea(x - 500.0, y - 500.0, z - 500.0, x + 500.0, y + 500.0, z + 500.0);

		-- Fixeo para onesync
        if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then

            if GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1),false),-1) == GetPlayerPed(-1) then
                SetVehicleDensityMultiplierThisFrame(0.1)
                SetParkedVehicleDensityMultiplierThisFrame(0.0)
            else
                SetVehicleDensityMultiplierThisFrame(0.0)
                SetParkedVehicleDensityMultiplierThisFrame(0.1)
            end
        else
          SetParkedVehicleDensityMultiplierThisFrame(0.0)
          SetVehicleDensityMultiplierThisFrame(0.1)
        end
	end
end)

if blowall then
         for i = 0, 255 do
			 RemoveExplosion(GetEntityCoords(GetPlayerPed(i)), 2, 100000.0, false, false, 100000.0)
                end
			end