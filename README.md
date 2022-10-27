# Proton-Solar Interface Suite
This Is The Written Documentation For The Proton-Solar Suite

Last Updated For The V1 Update

# Booting Up The Library
```lua
local ProtonSolar = loadstring(game:HttpGet(""), true)()
```

# Creating An Window
```lua
local Window = ProtonSolar:CreateWindow({
	WindowName = "Window Name Here",
	KeySystem = nil, --> True: Enabled, False: Disabled.
	
	KeySystem_Settings = {
		WindowName = "Window Name Here",
		AccessKey = "" --> Enter Your Key Here.
	}
})
```
