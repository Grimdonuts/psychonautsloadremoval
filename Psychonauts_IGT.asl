state("Psychonauts")
{
	bool isLoading : 0x38C7F4;
	string8 currentCutscene : 0x395A97;
	string18 savingPreferences : 0x038CB78, 0x38, 0x644, 0x4, 0x18, 0x128, 0x8, 0x0;
	string4 currentLevel : 0x38BC20, 0x989A;
}

startup
{
	settings.Add("BBLTCAKC", true, "Basic Braining");
	settings.Add("SACUCASA", true, "Shooting Gallery");
	settings.Add("MILLCABH", true, "Dance Party");
	settings.Add("NIBACASA", true, "Brain Tank");
	settings.Add("CAGPCABH", true, "Scavenger Hunt");
	settings.Add("LLLLLOMA", true, "Linda");
	settings.Add("LOCBASGR", true, "Lungfishopolis");
	settings.Add("MMDMASGR", true, "Milkman");
	settings.Add("THFBASGR", true, "Theater");
	settings.Add("BVMAASCO", true, "Black Velvetopia");
	settings.Add("WWMAASCO", true, "Waterloo World");
	settings.Add("ASRUMCTC", true, "Brain Tank 2");
	settings.Add("mcvi.bik", true, "Meat Circus Finish");
}

onStart
{
	vars.previousLevel = "";
}

init
{
	timer.IsGameTimePaused = false;
	vars.previousLevel = "";
}

start
{
	return current.savingPreferences == "Saving preferences";
}

split
{
	if (settings[vars.previousLevel+current.currentLevel]) {
		vars.previousLevel = current.currentLevel;
		return true;
	} else if (current.currentLevel != vars.previousLevel && current.currentLevel.Length > 0) {
		vars.previousLevel = current.currentLevel;
	}

	if (settings[current.currentCutscene]) {
		return true;
	}
}

isLoading
{
	return current.isLoading;
}

exit
{
	timer.IsGameTimePaused = true;
}
