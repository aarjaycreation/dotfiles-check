rule ={
	matches = {
		{
			{"node.name","equals","alsa_input.usb-Focusrite_Scarlett_Solo_USB_Y70DAWR074D97D-00.analog-stereo"},
		}
	},
	apply_properties = {
		["node.description"] = "Scarlett Solo Interface Input",
		["node.nick"] = "Scarlett Solo Input"
	}
}
table.insert(alsa_monitor.rules,rule)
