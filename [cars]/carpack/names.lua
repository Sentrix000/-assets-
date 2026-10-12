function AddTextEntry(key, value)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end

Citizen.CreateThread(function()
	AddTextEntry('argento','Argento')
	AddTextEntry('cypherct','Cypher Hatchback')
	AddTextEntry('dubsta4x4','Dubsta 4x4')
	AddTextEntry('dubstastr','Dubsta STR')
	AddTextEntry('elegyrh7','Elegy RH7')
	AddTextEntry('remustwo','Remus II')
	AddTextEntry('scheisser','Scheisser')
	AddTextEntry('schneider','Schneider')
	AddTextEntry('sentinelsg4','Sentinel SG4')
	AddTextEntry('streiter2','Streiter')
	AddTextEntry('sunrise1','Sunrise R')
	AddTextEntry('sentinelt','Sentinel GTS Touring')

	
	AddTextEntry('f140r','F140R')
	AddTextEntry('f240r','F240R')
	AddTextEntry('f340r','F340R')
	AddTextEntry('sen5tour','Sentinel GTS Touring')
	AddTextEntry('f540r','F540R')
	AddTextEntry('fx3r','FX3R')
	AddTextEntry('sent6','Sentinel X')

	
	AddTextEntry('kaiser','Kaiser')
	AddTextEntry('serrstr','Serrano STR')
	AddTextEntry('xlsstr','XLS STR')
	AddTextEntry('taurion','Taurion')
	AddTextEntry('srspback','Tailgater SR Hatchback')

	
	AddTextEntry('cazador','Cazador')
	AddTextEntry('flashgrs','Flash GRS')


end)