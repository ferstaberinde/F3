--------------------------------------------------------------------------------
                   ·:  Spectating Script v1.03 for ArmA 2 :·
--------------------------------------------------------------------------------

Spectating script for Armed Assault multiplayer mission designers.

The spectating script allows dead players to spectate other players, replacing
the default seagull mode. 

To use the Spectating Script in your mission do the following:
- If you do not already have init.sqf or description.ext files made for the
  mission then you can just copy the contents of files directory directly to
  the mission directory.

Otherwise do the following:
- Copy the files\spect directory into your mission directory (So that the
  spect directory remains)
- Add the contents of files\init.sqf to your mission init.sqf file so that the 
  spectating script init is run at the beginning of mission
- Copy files\onPlayerRespawnAsSeagull.sqs to the mission directory
- Add the contents of files\description.ext to your mission description.ext

The spectating script should now launch whenever a player would normally go
to seagull mode. To test the script in the editor you can execute the following
in a radio trigger:
foo = [player, player, "null"] execVM "spect\specta.sqf"

Note! If you need to do any modifications into the spectating script files for
your mission, please mark the modified files as modified by you to avoid 
confusing them with the originals.


--------------------------------------------------------------------------------
  version history
--------------------------------------------------------------------------------

* 1.03 
 - Dialog Conversion to Arma 2 [ViperMaul]
 - Arma 2 First Person View Fix [ViperMaul]
 - Arma 2 Free Cam Smoothing by addding a Marker Updates Toggle and adjusting update rates [Norrin]
 - Added ("H" Key) Toggle to enable Map Marker Updates (Default: OFF) [Norrin]
 - Special White-Hot Night Vision [ViperMaul]

KNOWN ISSUES:
 - Missile Cam not functioning properly in A2
 - Client Side LAG in Free Cam Mode HIGHLY possible when: 
   - Map Marker Updates are Enabled 
   - Unit Tags are Enabled


* 1.02 
 - Dialog Box fix for Arma 1.08 [ViperMaul]
* 1.01
 - Fixed global marker command when using limited sides
 - Improved performance with large number of units
 - Added gunsight toggle when in 1st person view (space key)
 - Fixed target listbox reseting selection every 4 seconds
 - Smoother motion when spectated unit height changes

--------------------------------------------------------------------------------
  credits
--------------------------------------------------------------------------------

Made by Kegetys <kegetys [ät] dnainternet.net> 
Modified by ViperMaul
Modified by Norrin

--------------------------------------------------------------------------------
  license & disclaimer
--------------------------------------------------------------------------------

You are permitted to install and use this software for personal entertainment 
purposes only. Any commercial, military or educational use is strictly forbidden
without permission from the author. 

You are free to distribute this software as you wish, as long as it is kept 100% 
free of charge, it is not modified in any way and this readme file is 
distributed with it.

The author takes no responsibility for any damages this program may cause, 
use at your own risk.

--------------------------------------------------------------------------------