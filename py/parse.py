import string
import re
import json

def strip_emojis(line):
	PERMITTED_CHARS = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_-: "
	return "".join(c for c in line if c in PERMITTED_CHARS)


def chomp(x):
    if x.endswith("\r\n"): return x[:-2]
    if x.endswith("\n"): return x[:-1]
    return x

lines = list(open("emojis.txt"))
emojis = dict()

group_name = ""
subgroup_name = ""

for line in lines:
	# There are 3 possible line formats
	#1. Group: GROUP_NAME
	if line.startswith("group: "):
		group_name = chomp(line.replace("group: ", ""))
		emojis[group_name] = dict()
	# 2. Subgroup: SUBGROUP_NAME
	elif line.startswith("subgroup: "):
		subgroup_name = chomp(line.replace("subgroup: ", ""))
		emojis[group_name][subgroup_name] = list()
	#3.
	else:
		#Lines containing _DISCARD_ should be discarded..
		if "_DISCARD_" in line:
			continue
		else:
			stripped = strip_emojis(line)
			words = stripped.split()
			code_points = list()
			# Codepoints
			while len(words) > 0 and len(words[0]) > 3 and all(c in string.hexdigits for c in words[0]) and not words[0].islower():
				code_points.append(chomp(words.pop(0)))
			description = " ".join(words)
			emojis[group_name][subgroup_name].append({"codepoints":code_points, "description":chomp(description)})

#Write emojis to JSON file
with open('emojis.json', 'w') as fp:
	json.dump(emojis, fp)
