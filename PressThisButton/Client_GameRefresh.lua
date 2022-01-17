function Client_GameRefresh(game)
    if (game.Us == nil) then return; end -- dont show popups for spectators, since PlayerGameData isnt available for them, so popup cant be disabled

    data = Mod.PlayerGameData;
    
	if (not data.InitialPopupDisplayed ) then
        UI.Alert("This game includes the Press This Button mod. If you dont press the button your income will be reduced by "..Mod.Settings.ReducePercent..'% next turn.')
		if (game.Us ~= nil) then
            payload = {};
            payload.msg = "InitialPopupDisplayed";
            game.SendGameCustomMessage("Updating server, please wait... ", payload, function(reply)end);
         end
	end
    
    if  (data.showWarning == nil) then data.showWarning=false; end
    if (data.warningMessage == nil) then data.warningMessage=""; end
    
    if (data.showWarning) then
        UI.Alert(data.warningMessage);
        game.SendGameCustomMessage("Updating server, please wait... ", {msg="WarningSeen"}, function(reply)end);
    end
end