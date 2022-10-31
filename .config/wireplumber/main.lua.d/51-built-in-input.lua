rule ={
	matches = {
		{
			{"node.name","equals","alsa_input.platform-snd_aloop.0.analog-stereo"},
		}
	},
	apply_properties = {
		["node.description"] = "Built-in Audio Input",
		["node.nick"] = "Built-in Audio Input"
	}
}
table.insert(alsa_monitor.rules,rule)
