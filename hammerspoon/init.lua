hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
  hs.alert.show("Hello World!")
end)

function openChromeApp(name)
    return function()
        -- Be sure to get the real name of the app (Use ls -a to check).
        hs.application.launchOrFocus(os.getenv('HOME') .. '/Applications/Chrome Apps.localized/' .. name .. '.app')
    end
end

-- hs.hotkey.bind({"alt"}, "B", openChromeApp('MultiVac Projects'))
