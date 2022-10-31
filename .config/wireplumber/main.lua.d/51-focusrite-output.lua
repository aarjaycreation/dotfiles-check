rule ={
	matches = {
		{
			{"node.name","equals","alsa_output.usb-Focusrite_Scarlett_Solo_USB_Y70DAWR074D97D-00.iec958-stereo"},
		}
	},
	apply_properties = {
		["node.description"] = "Scarlett Solo Interface Output",
		["node.nick"] = "Scarlett Solo Output"
	}
}
table.insert(alsa_monitor.rules,rule)
