PXFriendsAddon = {
  Name = "PXFriends",
  Version = "1.0.1",

  ColorGold   = '|cd8b620',
  ColorGray   = '|c6c7687',
  ColorGreen  = '|c28b712',
  ColorOrange = '|cf7952c',
  ColorRed    = '|cd61b1b',
  ColorWhite  = '|cffffff',
  ColorBlue   = '|c2d64bc',

  DefaultSettings = {
    left = 5,
    top = 20,

    fontColor = ZO_ColorDef:New("FFFFFF"),
    fontScale = 1,
    transparency = 0,
    showIfOffline = false,
    friends = {
      { Name = "@name", Status = "", Note = "", SecsSinceLogoff = 0, Color = '|cd8b620', CharacterName = "", Zone = "", CP = 0, Level = 0 },
      { Name = "@name", Status = "", Note = "", SecsSinceLogoff = 0, Color = '|cd8b620', CharacterName = "", Zone = "", CP = 0, Level = 0 },
      { Name = "@name", Status = "", Note = "", SecsSinceLogoff = 0, Color = '|cd8b620', CharacterName = "", Zone = "", CP = 0, Level = 0 },
      { Name = "@name", Status = "", Note = "", SecsSinceLogoff = 0, Color = '|cd8b620', CharacterName = "", Zone = "", CP = 0, Level = 0 },
      { Name = "@name", Status = "", Note = "", SecsSinceLogoff = 0, Color = '|cd8b620', CharacterName = "", Zone = "", CP = 0, Level = 0 },
      { Name = "@name", Status = "", Note = "", SecsSinceLogoff = 0, Color = '|cd8b620', CharacterName = "", Zone = "", CP = 0, Level = 0 },
      { Name = "@name", Status = "", Note = "", SecsSinceLogoff = 0, Color = '|cd8b620', CharacterName = "", Zone = "", CP = 0, Level = 0 },
      { Name = "@name", Status = "", Note = "", SecsSinceLogoff = 0, Color = '|cd8b620', CharacterName = "", Zone = "", CP = 0, Level = 0 },
      { Name = "@name", Status = "", Note = "", SecsSinceLogoff = 0, Color = '|cd8b620', CharacterName = "", Zone = "", CP = 0, Level = 0 },
      { Name = "@name", Status = "", Note = "", SecsSinceLogoff = 0, Color = '|cd8b620', CharacterName = "", Zone = "", CP = 0, Level = 0 },
      { Name = "@name", Status = "", Note = "", SecsSinceLogoff = 0, Color = '|cd8b620', CharacterName = "", Zone = "", CP = 0, Level = 0 },
      { Name = "@name", Status = "", Note = "", SecsSinceLogoff = 0, Color = '|cd8b620', CharacterName = "", Zone = "", CP = 0, Level = 0 },
      { Name = "@name", Status = "", Note = "", SecsSinceLogoff = 0, Color = '|cd8b620', CharacterName = "", Zone = "", CP = 0, Level = 0 },
      { Name = "@name", Status = "", Note = "", SecsSinceLogoff = 0, Color = '|cd8b620', CharacterName = "", Zone = "", CP = 0, Level = 0 },
      { Name = "@name", Status = "", Note = "", SecsSinceLogoff = 0, Color = '|cd8b620', CharacterName = "", Zone = "", CP = 0, Level = 0 },
      { Name = "@name", Status = "", Note = "", SecsSinceLogoff = 0, Color = '|cd8b620', CharacterName = "", Zone = "", CP = 0, Level = 0 },
      { Name = "@name", Status = "", Note = "", SecsSinceLogoff = 0, Color = '|cd8b620', CharacterName = "", Zone = "", CP = 0, Level = 0 },
      { Name = "@name", Status = "", Note = "", SecsSinceLogoff = 0, Color = '|cd8b620', CharacterName = "", Zone = "", CP = 0, Level = 0 },
      { Name = "@name", Status = "", Note = "", SecsSinceLogoff = 0, Color = '|cd8b620', CharacterName = "", Zone = "", CP = 0, Level = 0 },
      { Name = "@name", Status = "", Note = "", SecsSinceLogoff = 0, Color = '|cd8b620', CharacterName = "", Zone = "", CP = 0, Level = 0 },
    },
  },
}

PXFriendsAddon.savedVariables = PXFriendsAddon.DefaultSettings

---------------------------------------------------------------------------------------------------------
-- Initialize:
---------------------------------------------------------------------------------------------------------
function PXFriendsAddon:Initialize()
  ZO_CreateStringId("SI_BINDING_NAME_PX_FRIENDS_TOGGLE", GetString(PXIP_BINDINGS_TOGGLE))

  ------------
  -- EVENTS --
  ------------
  EVENT_MANAGER:RegisterForEvent(PXFriendsAddon.Name, EVENT_FRIEND_PLAYER_STATUS_CHANGED,
    function(eventCode, displayName, characterName, oldStatus, newStatus)
      PXFriendsAddon:GetFriendStatus()
      PXFriendsAddon:UpdateUI()
    end
  )

  PXFriendsAddon.savedVariables = ZO_SavedVars:NewAccountWide("PXFriendsSavedVariables", 1, nil, PXFriendsAddon.DefaultSettings)
  if (PXFriendsAddon.savedVariables == nil or PXFriendsAddon.savedVariables.left == nil) then  
    PXFriendsAddon.savedVariables = PXFriendsAddon.DefaultSettings
  end

  -- Get Friend Status:
  PXFriendsAddon:CreateSettingsWindow()
  PXFriendsAddon:RestorePosition()
  PXFriendsAddon:UpdateUI()
end

function PXFriendsAddon:GetFriendStatus()
  local friendCount = GetNumFriends()
  for x = 1, friendCount do

    local displayName, note, playerStatus, secsSinceLogoff = GetFriendInfo(x)
    local hasCharacter,  characterName, zoneName, classType, alliance, level, championRank, zoneId = GetFriendCharacterInfo(x)

    for y = 1, #PXFriendsAddon.savedVariables.friends do
      local friend = PXFriendsAddon.savedVariables.friends[y]

      if (displayName == friend.Name) then
        if (playerStatus == PLAYER_STATUS_ONLINE) then
          friend.Status = "Online"
        else
          friend.Status = "Offline"
        end
        friend.Note = note
        friend.SecsSinceLogoff = secsSinceLogoff
        friend.CharacterName = zo_strformat("<<1>>", characterName)
        friend.Level = level
        friend.CP = championRank
        friend.Zone = zoneName
        if (alliance == ALLIANCE_ALDMERI_DOMINION) then
          friend.Alliance = 'AD'
        elseif (alliance == ALLIANCE_DAGGERFALL_COVENANT) then
          friend.Alliance = 'DC'
        elseif (alliance == ALLIANCE_EBONHEART_PACT) then
          friend.alliance = 'EP'
        end
      end
    end
  end
end

---------------------------------------------------------------------------------------------------------
-- KEYBINDING EVENTS:
---------------------------------------------------------------------------------------------------------
function PXFriends_ProcessToggle()
  if PXFriendsAddon.Showing == true then
    PXFriendsAddon.Showing = false
    PXFriendsAddon:UpdateUI()
  else
    PXFriendsAddon.Showing = true
    PXFriendsAddon:UpdateUI()
  end
end

---------------------------------------------------------------------------------------------------------
-- E V E N T S
---------------------------------------------------------------------------------------------------------
function PXFriendsAddon.OnAddOnLoaded(event, addonName)
  if addonName == PXFriendsAddon.Name then
    EVENT_MANAGER:UnregisterForEvent(addonName, event)
    PXFriendsAddon:Initialize()
  end
end

function PXFriendsAddon.OnIndicatorMoveStop()
  PXFriendsAddon.savedVariables.left = PXFriendsAddonIndicator:GetLeft()
  PXFriendsAddon.savedVariables.top = PXFriendsAddonIndicator:GetTop()
end

-- Finally, we'll register our event handler function to be called when the proper event occurs.
EVENT_MANAGER:RegisterForEvent(PXFriendsAddon.Name, EVENT_ADD_ON_LOADED, PXFriendsAddon.OnAddOnLoaded)

---------------------------------------------------------------------------------------------------------
-- H E L P E R    F U N C T I O N S
---------------------------------------------------------------------------------------------------------
function PXFriendsAddon:FormatSeconds(secondsArg)
   local weeks = math.floor(secondsArg / 604800)
   local remainder = secondsArg % 604800
   local days = math.floor(remainder / 86400)
   local remainder = remainder % 86400
   local hours = math.floor(remainder / 3600)
   local remainder = remainder % 3600
   local minutes = math.floor(remainder / 60)
   local seconds = remainder % 60
   
   local weeksTxt, daysTxt, hoursTxt, minutesTxt, secondsTxt = ""
   if weeks == 1 then weeksTxt = 'week' else weeksTxt = 'weeks' end
   if days == 1 then daysTxt = 'day' else daysTxt = 'days' end
   if hours == 1 then hoursTxt = 'hour' else hoursTxt = 'hours' end
   if minutes == 1 then minutesTxt = 'minute' else minutesTxt = 'minutes' end
   if seconds == 1 then secondsTxt = 'second' else secondsTxt = 'seconds' end
   
   if secondsArg >= 604800 then
      return weeks .. ' ' .. weeksTxt .. ', ' .. days .. ' ' .. daysTxt .. ', ' .. hours .. ' ' .. hoursTxt .. ', ' .. minutes .. ' ' .. minutesTxt .. ', ' .. seconds .. ' ' .. secondsTxt
   elseif secondsArg >= 86400 then
      return days .. ' ' .. daysTxt .. ', ' .. hours .. ' ' .. hoursTxt .. ', ' .. minutes .. ' ' .. minutesTxt .. ', ' .. seconds .. ' ' .. secondsTxt
   elseif secondsArg >= 3600 then
      return hours .. ' ' .. hoursTxt .. ', ' .. minutes .. ' ' .. minutesTxt .. ', ' .. seconds .. ' ' .. secondsTxt
   elseif secondsArg >= 60 then
      return minutes .. ' ' .. minutesTxt .. ', ' .. seconds .. ' ' .. secondsTxt
   else
      return seconds  ..  ' '  ..  secondsTxt
   end  
  end

function PXFriendsAddon:Notify(text, sound)
  local params = CENTER_SCREEN_ANNOUNCE:CreateMessageParams(text, sound)
  params:SetCSAType(CENTER_SCREEN_ANNOUNCE_TYPE_ACHIEVEMENT_AWARDED)
  params:SetText(text)
  CENTER_SCREEN_ANNOUNCE:AddMessageWithParams(params)
end

function PXFriendsAddon:RestorePosition()
  local left = self.savedVariables.left
  local top = self.savedVariables.top
  if left == 0 and top == 0 then
    left = 100
    top = 100
  end
 
  PXFriendsAddonIndicator:ClearAnchors()
  PXFriendsAddonIndicator:SetAnchor(TOPLEFT, GuiRoot, TOPLEFT, left, top)
end

function PXFriendsAddon:SecondsToClock(seconds)
  local seconds = tonumber(seconds)

  if seconds <= 0 then
    return "00:00:00";
  else
    hours = string.format("%02.f", math.floor(seconds / 3600));
    mins = string.format("%02.f", math.floor(seconds / 60 - (hours * 60)));
    secs = string.format("%02.f", math.floor(seconds - hours * 3600 - mins * 60));
    return hours..":"..mins..":"..secs
  end
end

function PXFriendsAddon:RGBToHex(col)
  r = string.format("%x", col.r*255)
  g = string.format("%x", col.g*255)
  b = string.format("%x", col.b*255)
  if #r < 2 then r = "0" .. r end
  if #g < 2 then g = "0" .. g end
  if #b < 2 then b = "0" .. b end
  return '|c' .. r .. g .. b
end

function PXFriendsAddon:UpdateUI()
  local text = ''
  local newLine = ''

  PXFriendsAddon:GetFriendStatus()

  if PXFriendsAddon.Showing == false then
    PXFriendsAddonIndicator:SetHidden(true)
  else
    PXFriendsAddonIndicator:SetHidden(false)
  end

  if (self.savedVariables.showFriendStatus) then
    text = text .. newLine .. '...'
  end

  -- Show friends online
  for x = 1, #self.savedVariables.friends do
    local friend = self.savedVariables.friends[x]
    if (friend.Name ~= nil and friend.Name ~= '@name') then
      if (friend.Status == "Online") then
        text = text .. newLine .. PXFriendsAddon:RGBToHex(friend.Color) .. friend.Name .. '|r' .. ' (' .. friend.CharacterName .. ' ~ ' .. friend.Zone .. ', CP: ' .. friend.CP .. ', ' .. friend.Alliance .. ')'
        newLine = '\n'
      else
        if (self.savedVariables.showIfOffline == true and friend.SecsSinceLogoff ~= nil and friend.SecsSinceLogoff > 0) then
          text = text .. newLine .. self.ColorGray .. friend.Name .. '|r -- ' .. self:SecondsToClock(friend.SecsSinceLogoff)
          newLine = '\n'
        end
      end
    end
  end

  self:WriteLog(text)
end

function PXFriendsAddon:WriteLog(text)
  if PXFriendsAddon.savedVariables.fontScale ~= nil then
    PXFriendsAddonIndicatorLabel:SetScale(PXFriendsAddon.savedVariables.fontScale)
  end
  if PXFriendsAddon.savedVariables.fontColor ~= nil then
    PXFriendsAddonIndicatorLabel:SetColor(PXFriendsAddon.savedVariables.fontColor.r, PXFriendsAddon.savedVariables.fontColor.g, PXFriendsAddon.savedVariables.fontColor.b)
  end
  PXFriendsAddonIndicatorBG:SetAlpha(PXFriendsAddon.savedVariables.transparency)

  PXFriendsAddonIndicatorLabel:SetText(text)

  local x = PXFriendsAddonIndicatorLabel:GetWidth()
  local y = PXFriendsAddonIndicatorLabel:GetHeight()
  PXFriendsAddonIndicator:SetDimensions(x + 15, y + 15)

  zo_callLater(
    function () 
      PXFriendsAddon:UpdateUI()
    end, 60000
  )

end
