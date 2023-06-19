local scriptName = "insert script name here"
local webhookURL = "insert webhook url here"


local http_service = game:GetService("HttpService")
local plr = game:GetService("Players").LocalPlayer

local weebhook_url = webhookURL

local avatar_bust = http_service:JSONDecode(game:HttpGet("https://thumbnails.roblox.com/v1/users/avatar-bust?userIds=" .. tostring(plr.UserId) .. "&size=150x150&format=Png&isCircular=false"))

local json_string = http_service:JSONEncode({
   embeds = {
       {
           title = "someone executed ".. scriptName,
           description = "username: " .. plr.Name .. "\nuser id: " .. tostring(plr.UserId) .. "\nserver job id: " .. tostring(game.JobId),
           type = "rich",
           color = 0xff6961,
           image = {
               url = avatar_bust.data[1].imageUrl
           }
       }
   }
})

request = http_request or request or HttpPost or syn.request

request({
    Url = weebhook_url,
    Body = json_string,
    Method = "POST",
    Headers = {
        ["content-type"] = "application/json"
    }
})
