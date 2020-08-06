function sendForbiddenMessage(message)
	TriggerEvent("chatMessage", "", {0, 0, 0}, "^3" .. message)
end

function _DeleteEntity(entity)
	Citizen.InvokeNative(0xAE3CBE5BF394C9C9, Citizen.PointerValueIntInitialized(entity))
end