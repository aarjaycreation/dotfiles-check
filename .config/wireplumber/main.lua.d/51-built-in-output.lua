rule ={
	matches = {
		{
			{"node.name","equals","alsa_output.platform-snd_aloop.0.analog-stereo"},
		}
	},
	apply_properties = {
		["node.description"] = "Built-in Audio Output",
		["node.nick"] = "Built-in Audio Output"
	}
}
table.insert(alsa_monitor.rules,rule)
