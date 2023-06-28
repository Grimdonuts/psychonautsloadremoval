state("Psychonauts")
{
	bool isLoading : 0x38C7F4;
	string8 currentCutscene : 0x395A97;
	string18 savingPreferences : 0x038CB78, 0x38, 0x644, 0x4, 0x18, 0x128, 0x8, 0x0;
	string18 savingPreferences2 : 0x038CB88, 0x10, 0x84, 0x30, 0x10, 0x8, 0x0;
	string18 savingPreferences3 : 0x038CB78, 0x38, 0x644, 0x4, 0x18, 0x128, 0x8, 0x0;
	string18 savingPreferences4 :  0x038CB88, 0x10, 0x84, 0x10, 0x10, 0x8, 0x0;
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
	settings.Add("CALICAMA", false, "Cobweb Duster");
	settings.Add("LOCBASGR", true, "Lungfishopolis");
	settings.Add("MMDMASGR", true, "Milkman");
	settings.Add("THFBASGR", true, "Theater");
	settings.Add("BVMAASCO", true, "Black Velvetopia");
	settings.Add("WWMAASCO", true, "Waterloo World");
	settings.Add("ASRUMCTC", true, "Brain Tank 2");
	settings.Add("mcvi.bik", true, "Meat Circus Finish");

	// Code by Micrologist
    if (timer.CurrentTimingMethod == TimingMethod.RealTime)
    {
        var timingMessage = MessageBox.Show (
            "This game uses Time without Loads (Game Time) as the main timing method.\n"+
            "LiveSplit is currently set to show Real Time (RTA).\n"+
            "Would you like to set the timing method to Game Time?",
            "LiveSplit | Psychonauts",
            MessageBoxButtons.YesNo,MessageBoxIcon.Question
        );
        if (timingMessage == DialogResult.Yes)
        {
            timer.CurrentTimingMethod = TimingMethod.GameTime;
        }
    }
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
	return current.savingPreferences == "Saving preferences" || current.savingPreferences2 == "Saving preferences" || current.savingPreferences3 == "Saving preferences" 
	|| current.savingPreferences4 == "Saving preferences";
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
