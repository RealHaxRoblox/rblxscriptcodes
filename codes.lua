print("CodeScript codes")
print("1. Reviz : Reviz Admin 2.0")
local function SendNotification(title,text,duration,...)
  game.StarterGui:SetCore("SendNotification", {
    Title = title;
    Text = text;
	Icon = "";
    Duration = duration;
  })
end
SendNotification("Done.","Do Ctrl + F9 to se them!",10 )
