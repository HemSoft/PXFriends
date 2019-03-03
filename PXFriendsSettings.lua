---------------------------------------------------------------------------------------------------------
-- S E T T I N G S
---------------------------------------------------------------------------------------------------------
function PXFriendsAddon:CreateSettingsWindow()
  local LAM2 = LibStub("LibAddonMenu-2.0")
  local panelData =
  {
    type                = "panel",
    name                = self.Name,
    displayName         = "PXFriends",
    author              = "|c28b712PhaeroX|r",
    version             = self.Version,
    registerForRefresh  = true,
    registerForDefaults = true
  }

  local cntrlOptionsPanel = LAM2:RegisterAddonPanel(self.Name, panelData)

  local optionsData =
  {
    {
      type = "description",
      text = "PhaeroX Friends Settings:",
    },
    {
      type = "button",
      name = "Show window:",
      func = function()
        PXFriendsAddonIndicator:SetHidden(false)
      end,
      width = "full",
    },

    ---------------------
    -- Window Settings --
    ---------------------
    {
      type = "submenu",
      name = "Window Settings",
      controls =
      {
        {
          type = "colorpicker",
          name = "Font Color:",
          getFunc = function() return self.savedVariables.fontColor.r, self.savedVariables.fontColor.g, self.savedVariables.fontColor.g end,
          setFunc = function(r,g,b,a) self.savedVariables.fontColor = { ["r"] = r, ["g"] = g, ["b"] = b }; PXFriendsAddon:UpdateUI() end,
          default = { r = 1, g = 1, b = 1 },
        },
        {
          type = "slider",
          name = "Font Scale",
          min = 0, max = 3, step = 0.1,
          getFunc = function() return self.savedVariables.fontScale end,
          setFunc = function(value) self.savedVariables.fontScale = value; PXFriendsAddon:UpdateUI() end,
          disabled = function() return false end,
          width = "full",
          default = 1,
        },
        {
          type = "slider",
          name = "Background Transparency:",
          min = 0, max = 1, step = 0.1,
          getFunc = function() return self.savedVariables.transparency end,
          setFunc = function(value) self.savedVariables.transparency = value; PXFriendsAddon:UpdateUI() end,
          width = "full",
          default = 0,
        },
        {
          type = "checkbox",
          name = "Show offline players:",
          getFunc = function() return self.savedVariables.showIfOffline end,
          setFunc = function(value) self.savedVariables.showIfOffline = value; PXFriendsAddon:UpdateUI() end,
          width = "full",
          default = false,
        },
      }
    },

    --------------
    -- Friend 1 --
    --------------
    {
      type = "submenu",
      name = "Friend 1:",
      controls =
      {
        {
          type    = "editbox",
          name    = "At Name:",
          getFunc = function() return self.savedVariables.friends[1].Name; end,
          setFunc = function(e) self.savedVariables.friends[1].Name = e; PXFriendsAddon:UpdateUI() end,
          width   = "full",
        },
        {
          type = "colorpicker",
          name = "Color:",
          getFunc = function() return self.savedVariables.friends[1].Color.r, self.savedVariables.friends[1].Color.g, self.savedVariables.friends[1].Color.g end,
          setFunc = function(r,g,b,a) self.savedVariables.friends[1].Color = { ["r"] = r, ["g"] = g, ["b"] = b }; PXFriendsAddon:UpdateUI() end,
          width   = "full",
        },
      }
    },

    --------------
    -- Friend 2 --
    --------------
    {
      type = "submenu",
      name = "Friend 2:",
      controls =
      {
        {
          type    = "editbox",
          name    = "At Name:",
          getFunc = function() return self.savedVariables.friends[2].Name; end,
          setFunc = function(e) self.savedVariables.friends[2].Name = e; PXFriendsAddon:UpdateUI() end,
          width   = "full",
        },
        {
          type = "colorpicker",
          name = "Color:",
          getFunc = function() return self.savedVariables.friends[2].Color.r, self.savedVariables.friends[2].Color.g, self.savedVariables.friends[2].Color.g end,
          setFunc = function(r,g,b,a) self.savedVariables.friends[2].Color = { ["r"] = r, ["g"] = g, ["b"] = b }; PXFriendsAddon:UpdateUI() end,
          width   = "full",
        },
      }
    },

    --------------
    -- Friend 3 --
    --------------
    {
      type = "submenu",
      name = "Friend 3:",
      controls =
      {
        {
          type    = "editbox",
          name    = "At Name:",
          getFunc = function() return self.savedVariables.friends[3].Name; end,
          setFunc = function(e) self.savedVariables.friends[3].Name = e; PXFriendsAddon:UpdateUI() end,
          width   = "full",
        },
        {
          type = "colorpicker",
          name = "Color:",
          getFunc = function() return self.savedVariables.friends[3].Color.r, self.savedVariables.friends[3].Color.g, self.savedVariables.friends[3].Color.g end,
          setFunc = function(r,g,b,a) self.savedVariables.friends[3].Color = { ["r"] = r, ["g"] = g, ["b"] = b }; PXFriendsAddon:UpdateUI() end,
          width   = "full",
        },
      }
    },

    --------------
    -- Friend 4 --
    --------------
    {
      type = "submenu",
      name = "Friend 4:",
      controls =
      {
        {
          type    = "editbox",
          name    = "At Name:",
          getFunc = function() return self.savedVariables.friends[4].Name; end,
          setFunc = function(e) self.savedVariables.friends[4].Name = e; PXFriendsAddon:UpdateUI() end,
          width   = "full",
        },
        {
          type = "colorpicker",
          name = "Color:",
          getFunc = function() return self.savedVariables.friends[4].Color.r, self.savedVariables.friends[4].Color.g, self.savedVariables.friends[4].Color.g end,
          setFunc = function(r,g,b,a) self.savedVariables.friends[4].Color = { ["r"] = r, ["g"] = g, ["b"] = b }; PXFriendsAddon:UpdateUI() end,
          width   = "full",
        },
      }
    },

    --------------
    -- Friend 5 --
    --------------
    {
      type = "submenu",
      name = "Friend 5:",
      controls =
      {
        {
          type    = "editbox",
          name    = "At Name:",
          getFunc = function() return self.savedVariables.friends[5].Name; end,
          setFunc = function(e) self.savedVariables.friends[5].Name = e; PXFriendsAddon:UpdateUI() end,
          width   = "full",
        },
        {
          type = "colorpicker",
          name = "Color:",
          getFunc = function() return self.savedVariables.friends[5].Color.r, self.savedVariables.friends[5].Color.g, self.savedVariables.friends[5].Color.g end,
          setFunc = function(r,g,b,a) self.savedVariables.friends[5].Color = { ["r"] = r, ["g"] = g, ["b"] = b }; PXFriendsAddon:UpdateUI() end,
          width   = "full",
        },
      }
    },

    --------------
    -- Friend 6 --
    --------------
    {
      type = "submenu",
      name = "Friend 6:",
      controls =
      {
        {
          type    = "editbox",
          name    = "At Name:",
          getFunc = function() return self.savedVariables.friends[6].Name; end,
          setFunc = function(e) self.savedVariables.friends[6].Name = e; PXFriendsAddon:UpdateUI() end,
          width   = "full",
        },
        {
          type = "colorpicker",
          name = "Color:",
          getFunc = function() return self.savedVariables.friends[6].Color.r, self.savedVariables.friends[6].Color.g, self.savedVariables.friends[6].Color.g end,
          setFunc = function(r,g,b,a) self.savedVariables.friends[6].Color = { ["r"] = r, ["g"] = g, ["b"] = b }; PXFriendsAddon:UpdateUI() end,
          width   = "full",
        },
      }
    },

    --------------
    -- Friend 7 --
    --------------
    {
      type = "submenu",
      name = "Friend 7:",
      controls =
      {
        {
          type    = "editbox",
          name    = "At Name:",
          getFunc = function() return self.savedVariables.friends[7].Name; end,
          setFunc = function(e) self.savedVariables.friends[7].Name = e; PXFriendsAddon:UpdateUI() end,
          width   = "full",
        },
        {
          type = "colorpicker",
          name = "Color:",
          getFunc = function() return self.savedVariables.friends[7].Color.r, self.savedVariables.friends[7].Color.g, self.savedVariables.friends[7].Color.g end,
          setFunc = function(r,g,b,a) self.savedVariables.friends[7].Color = { ["r"] = r, ["g"] = g, ["b"] = b }; PXFriendsAddon:UpdateUI() end,
          width   = "full",
        },
      }
    },

    --------------
    -- Friend 8 --
    --------------
    {
      type = "submenu",
      name = "Friend 8:",
      controls =
      {
        {
          type    = "editbox",
          name    = "At Name:",
          getFunc = function() return self.savedVariables.friends[8].Name; end,
          setFunc = function(e) self.savedVariables.friends[8].Name = e; PXFriendsAddon:UpdateUI() end,
          width   = "full",
        },
        {
          type = "colorpicker",
          name = "Color:",
          getFunc = function() return self.savedVariables.friends[8].Color.r, self.savedVariables.friends[8].Color.g, self.savedVariables.friends[8].Color.g end,
          setFunc = function(r,g,b,a) self.savedVariables.friends[8].Color = { ["r"] = r, ["g"] = g, ["b"] = b }; PXFriendsAddon:UpdateUI() end,
          width   = "full",
        },
      }
    },

    --------------
    -- Friend 9 --
    --------------
    {
      type = "submenu",
      name = "Friend 9:",
      controls =
      {
        {
          type    = "editbox",
          name    = "At Name:",
          getFunc = function() return self.savedVariables.friends[9].Name; end,
          setFunc = function(e) self.savedVariables.friends[9].Name = e; PXFriendsAddon:UpdateUI() end,
          width   = "full",
        },
        {
          type = "colorpicker",
          name = "Color:",
          getFunc = function() return self.savedVariables.friends[9].Color.r, self.savedVariables.friends[9].Color.g, self.savedVariables.friends[9].Color.g end,
          setFunc = function(r,g,b,a) self.savedVariables.friends[9].Color = { ["r"] = r, ["g"] = g, ["b"] = b }; PXFriendsAddon:UpdateUI() end,
          width   = "full",
        },
      }
    },

    ---------------
    -- Friend 10 --
    ---------------
    {
      type = "submenu",
      name = "Friend 10:",
      controls =
      {
        {
          type    = "editbox",
          name    = "At Name:",
          getFunc = function() return self.savedVariables.friends[10].Name; end,
          setFunc = function(e) self.savedVariables.friends[10].Name = e; PXFriendsAddon:UpdateUI() end,
          width   = "full",
        },
        {
          type = "colorpicker",
          name = "Color:",
          getFunc = function() return self.savedVariables.friends[10].Color.r, self.savedVariables.friends[10].Color.g, self.savedVariables.friends[10].Color.g end,
          setFunc = function(r,g,b,a) self.savedVariables.friends[10].Color = { ["r"] = r, ["g"] = g, ["b"] = b }; PXFriendsAddon:UpdateUI() end,
          width   = "full",
        },
      }
    },

    ---------------
    -- Friend 11 --
    ---------------
    {
      type = "submenu",
      name = "Friend 11:",
      controls =
      {
        {
          type    = "editbox",
          name    = "At Name:",
          getFunc = function() return self.savedVariables.friends[11].Name; end,
          setFunc = function(e) self.savedVariables.friends[11].Name = e; PXFriendsAddon:UpdateUI() end,
          width   = "full",
        },
        {
          type = "colorpicker",
          name = "Color:",
          getFunc = function() return self.savedVariables.friends[11].Color.r, self.savedVariables.friends[11].Color.g, self.savedVariables.friends[11].Color.g end,
          setFunc = function(r,g,b,a) self.savedVariables.friends[11].Color = { ["r"] = r, ["g"] = g, ["b"] = b }; PXFriendsAddon:UpdateUI() end,
          width   = "full",
        },
      }
    },

    ---------------
    -- Friend 12 --
    ---------------
    {
      type = "submenu",
      name = "Friend 12:",
      controls =
      {
        {
          type    = "editbox",
          name    = "At Name:",
          getFunc = function() return self.savedVariables.friends[12].Name; end,
          setFunc = function(e) self.savedVariables.friends[12].Name = e; PXFriendsAddon:UpdateUI() end,
          width   = "full",
        },
        {
          type = "colorpicker",
          name = "Color:",
          getFunc = function() return self.savedVariables.friends[12].Color.r, self.savedVariables.friends[12].Color.g, self.savedVariables.friends[12].Color.g end,
          setFunc = function(r,g,b,a) self.savedVariables.friends[12].Color = { ["r"] = r, ["g"] = g, ["b"] = b }; PXFriendsAddon:UpdateUI() end,
          width   = "full",
        },
      }
    },

    ---------------
    -- Friend 13 --
    ---------------
    {
      type = "submenu",
      name = "Friend 13:",
      controls =
      {
        {
          type    = "editbox",
          name    = "At Name:",
          getFunc = function() return self.savedVariables.friends[13].Name; end,
          setFunc = function(e) self.savedVariables.friends[13].Name = e; PXFriendsAddon:UpdateUI() end,
          width   = "full",
        },
        {
          type = "colorpicker",
          name = "Color:",
          getFunc = function() return self.savedVariables.friends[13].Color.r, self.savedVariables.friends[13].Color.g, self.savedVariables.friends[13].Color.g end,
          setFunc = function(r,g,b,a) self.savedVariables.friends[13].Color = { ["r"] = r, ["g"] = g, ["b"] = b }; PXFriendsAddon:UpdateUI() end,
          width   = "full",
        },
      }
    },

    ---------------
    -- Friend 14 --
    ---------------
    {
      type = "submenu",
      name = "Friend 14:",
      controls =
      {
        {
          type    = "editbox",
          name    = "At Name:",
          getFunc = function() return self.savedVariables.friends[14].Name; end,
          setFunc = function(e) self.savedVariables.friends[14].Name = e; PXFriendsAddon:UpdateUI() end,
          width   = "full",
        },
        {
          type = "colorpicker",
          name = "Color:",
          getFunc = function() return self.savedVariables.friends[14].Color.r, self.savedVariables.friends[14].Color.g, self.savedVariables.friends[14].Color.g end,
          setFunc = function(r,g,b,a) self.savedVariables.friends[14].Color = { ["r"] = r, ["g"] = g, ["b"] = b }; PXFriendsAddon:UpdateUI() end,
          width   = "full",
        },
      }
    },

    ---------------
    -- Friend 15 --
    ---------------
    {
      type = "submenu",
      name = "Friend 15:",
      controls =
      {
        {
          type    = "editbox",
          name    = "At Name:",
          getFunc = function() return self.savedVariables.friends[15].Name; end,
          setFunc = function(e) self.savedVariables.friends[15].Name = e; PXFriendsAddon:UpdateUI() end,
          width   = "full",
        },
        {
          type = "colorpicker",
          name = "Color:",
          getFunc = function() return self.savedVariables.friends[15].Color.r, self.savedVariables.friends[15].Color.g, self.savedVariables.friends[15].Color.g end,
          setFunc = function(r,g,b,a) self.savedVariables.friends[15].Color = { ["r"] = r, ["g"] = g, ["b"] = b }; PXFriendsAddon:UpdateUI() end,
          width   = "full",
        },
      }
    },

    ---------------
    -- Friend 16 --
    ---------------
    {
      type = "submenu",
      name = "Friend 16:",
      controls =
      {
        {
          type    = "editbox",
          name    = "At Name:",
          getFunc = function() return self.savedVariables.friends[16].Name; end,
          setFunc = function(e) self.savedVariables.friends[16].Name = e; PXFriendsAddon:UpdateUI() end,
          width   = "full",
        },
        {
          type = "colorpicker",
          name = "Color:",
          getFunc = function() return self.savedVariables.friends[16].Color.r, self.savedVariables.friends[16].Color.g, self.savedVariables.friends[16].Color.g end,
          setFunc = function(r,g,b,a) self.savedVariables.friends[16].Color = { ["r"] = r, ["g"] = g, ["b"] = b }; PXFriendsAddon:UpdateUI() end,
          width   = "full",
        },
      }
    },

    ---------------
    -- Friend 17 --
    ---------------
    {
      type = "submenu",
      name = "Friend 17:",
      controls =
      {
        {
          type    = "editbox",
          name    = "At Name:",
          getFunc = function() return self.savedVariables.friends[17].Name; end,
          setFunc = function(e) self.savedVariables.friends[17].Name = e; PXFriendsAddon:UpdateUI() end,
          width   = "full",
        },
        {
          type = "colorpicker",
          name = "Color:",
          getFunc = function() return self.savedVariables.friends[17].Color.r, self.savedVariables.friends[17].Color.g, self.savedVariables.friends[17].Color.g end,
          setFunc = function(r,g,b,a) self.savedVariables.friends[17].Color = { ["r"] = r, ["g"] = g, ["b"] = b }; PXFriendsAddon:UpdateUI() end,
          width   = "full",
        },
      }
    },

    ---------------
    -- Friend 18 --
    ---------------
    {
      type = "submenu",
      name = "Friend 18:",
      controls =
      {
        {
          type    = "editbox",
          name    = "At Name:",
          getFunc = function() return self.savedVariables.friends[18].Name; end,
          setFunc = function(e) self.savedVariables.friends[18].Name = e; PXFriendsAddon:UpdateUI() end,
          width   = "full",
        },
        {
          type = "colorpicker",
          name = "Color:",
          getFunc = function() return self.savedVariables.friends[18].Color.r, self.savedVariables.friends[18].Color.g, self.savedVariables.friends[18].Color.g end,
          setFunc = function(r,g,b,a) self.savedVariables.friends[18].Color = { ["r"] = r, ["g"] = g, ["b"] = b }; PXFriendsAddon:UpdateUI() end,
          width   = "full",
        },
      }
    },

    ---------------
    -- Friend 19 --
    ---------------
    {
      type = "submenu",
      name = "Friend 19:",
      controls =
      {
        {
          type    = "editbox",
          name    = "At Name:",
          getFunc = function() return self.savedVariables.friends[19].Name; end,
          setFunc = function(e) self.savedVariables.friends[19].Name = e; PXFriendsAddon:UpdateUI() end,
          width   = "full",
        },
        {
          type = "colorpicker",
          name = "Color:",
          getFunc = function() return self.savedVariables.friends[19].Color.r, self.savedVariables.friends[19].Color.g, self.savedVariables.friends[19].Color.g end,
          setFunc = function(r,g,b,a) self.savedVariables.friends[19].Color = { ["r"] = r, ["g"] = g, ["b"] = b }; PXFriendsAddon:UpdateUI() end,
          width   = "full",
        },
      }
    },

    ---------------
    -- Friend 20 --
    ---------------
    {
      type = "submenu",
      name = "Friend 20:",
      controls =
      {
        {
          type    = "editbox",
          name    = "At Name:",
          getFunc = function() return self.savedVariables.friends[20].Name; end,
          setFunc = function(e) self.savedVariables.friends[20].Name = e; PXFriendsAddon:UpdateUI() end,
          width   = "full",
        },
        {
          type = "colorpicker",
          name = "Color:",
          getFunc = function() return self.savedVariables.friends[20].Color.r, self.savedVariables.friends[20].Color.g, self.savedVariables.friends[20].Color.g end,
          setFunc = function(r,g,b,a) self.savedVariables.friends[20].Color = { ["r"] = r, ["g"] = g, ["b"] = b }; PXFriendsAddon:UpdateUI() end,
          width   = "full",
        },
      }
    },

    --------------------
    -- Notify Options --
    --------------------
    {
      type = "submenu",
      name = "Toggle nofity options:",
      controls =
      {
        {
          type    = "checkbox",
          name    = "Show friends when offline:",
          tooltip = "Whether or not to display a friend even if she/he are offline.",
          getFunc = function() return self.savedVariables.showIfOffline end,
          setFunc = function(e) self.savedVariables.showIfOffline = e; PXFriendsAddon:UpdateUI() end,
          default = true,
        },
      },
    },
  }

  LAM2:RegisterOptionControls(self.Name, optionsData)
end
