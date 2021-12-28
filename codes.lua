print("CodeScript codes")
print(" Reviz : Reviz Admin 2.0")
print(" inDEX : Dex Exlplorer 2.0")
print("PrisonWarden : Best Prison Life scripts")
print("Eclipse : Eclipse for MM2")
print("ElonMusk : Fly Car for prison life.")
print("HomeRun : Baseball bat")
local function SendNotification(title,text,duration,...)
  game.StarterGui:SetCore("SendNotification", {
    Title = title;
    Text = text;
	Icon = "";
    Duration = duration;
  })
end
SendNotification("Done.","Do Ctrl + F9 to see them!",10 )
