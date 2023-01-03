state("Psychonauts")
{
	bool isLoading : 0x38C7F4;
	string8 currentCutscene : 0x395A97;
	string18 savingPreferences : 0x1079A0, 0x34, 0x58, 0xC, 0x40, 0x8, 0x0;
}

startup
{
	settings.Add("cabv.bik", true, "BasicBraining");
	settings.Add("marksman", true, "ShootingGallery");
	settings.Add("caem_win", true, "DanceParty");
	settings.Add("nien.bik", true, "BrainTank");
	settings.Add("llbt.bik", true, "ScavengerHunt");
	settings.Add("llil.bik", true, "Linda");
	settings.Add("love.bik", true, "Lungfishopolis");
	settings.Add("mmdd.bik", true, "Milkman");
	settings.Add("thbf.bik", true, "Theater");
	settings.Add("bvvi.bik", true, "BlackVelvetopia");
	settings.Add("aswv.bik", true, "WaterlooWorld");
	settings.Add("assp.bik", true, "BrainTank2");
	settings.Add("mcvi.bik", true, "MeatCircusFinish");
}

onStart
{
	vars.oldSceneSplit = "";
	vars.brainTank2Kill = false;
}

init
{
	timer.IsGameTimePaused = false;
	vars.oldSceneSplit = "";
	vars.brainTank2Kill = false;
}

start
{
	return current.savingPreferences == "Saving preferences";
}

split
{
	if (current.currentCutscene != vars.oldSceneSplit && settings[current.currentCutscene] && current.currentCutscene != "assp.bik")
	{
		vars.oldSceneSplit = current.currentCutscene;
		return true;
	}

	if (current.currentCutscene == "assp.bik" && settings[current.currentCutscene] && !vars.brainTank2Kill)
	{
		vars.brainTank2Kill = true;
	}
	else if (vars.brainTank2Kill && current.isLoading)
	{
		vars.brainTank2Kill = false;
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
