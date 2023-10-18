rule ={
	matches = {
		{
			{"node.description","equals","GA104 High Definition Audio Controller Digital Stereo (HDMI)"},
		}
	},
	apply_properties = {
		["node.description"] = "Acer Monitor Speakers",
		["node.nick"] = "Acer Monitor Speakers"
	}
}
table.insert(alsa_monitor.rules,rule)
