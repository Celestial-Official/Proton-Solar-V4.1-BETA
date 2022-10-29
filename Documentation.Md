# Proton-Solar Interface Suite
This Is The Written Documentation For The Proton-Solar Suite

Last Updated For The V4.1 | Beta Update

# Booting Up The Library
```lua
local ProtonSolar = loadstring(game:HttpGet("Coming Soon."), true)()
```

# Creating An Window
```lua
local Window = ProtonSolar:CreateWindow({
	WindowName = "Window Name Here",
	KeySystem = false, --> True: Enabled, False: Disabled.
	
	KeySettings = {
		WindowName = "Window Name Here",
		AccessKey = "Access Key Here"
	}
})
```

