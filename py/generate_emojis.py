import string
import re
import json
import urllib

def strip_emojis(line):
	PERMITTED_CHARS = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_-: " 
	return "".join(c for c in line if c in PERMITTED_CHARS)


def chomp(x):
    if x.endswith("\r\n"): return x[:-2]
    if x.endswith("\n"): return x[:-1]
    return x

url_file_path = "https://www.unicode.org/Public/emoji/latest/"
emoji_test_file = "emoji-test.txt"
group_prefix = "# group: "
subgroup_prefix = "# subgroup: "
delimiter = ";"

print("Retrieving latest emoji data file...")
urllib.urlretrieve(url_file_path + emoji_test_file, emoji_test_file)

lines = list(open(emoji_test_file))
emojis = dict()

group_name = ""
subgroup_name = ""
print("Parsing file...")
for line in lines:
	# A line should be disregarded if:
		#0. It is an empty line
		#1. it is a meta line (non-emoji line) that does not provide info on the group/subgroup name
		#2. It is a non-qualified emoji line
	if len(line.strip()) == 0:
		continue
	if line.startswith("#") and not group_prefix in line and not subgroup_prefix in line:
		continue
	if "; non-fully-qualified " in line:
		continue

	# There are 3 possible valid lines
	#1. Group: GROUP_NAME
	if line.startswith(group_prefix):
		group_name = chomp(line.replace(group_prefix, ""))
		emojis[group_name] = dict()
	# 2. Subgroup: SUBGROUP_NAME
	elif line.startswith(subgroup_prefix):
		subgroup_name = chomp(line.replace(subgroup_prefix, ""))
		emojis[group_name][subgroup_name] = list()
	#3. an emoji line
	else:
		code_points = line.split(delimiter)[0].strip().split(" ")
		description = strip_emojis(line.split(delimiter)[1].replace("fully-qualified", "")).strip()
		print(" ".join(code_points) + ": " + description)
		emojis[group_name][subgroup_name].append({"codepoints":code_points, "description":description})

#Write emojis to JSON file
print("Writing data to emojis.json")
with open('emojis.json', 'w') as fp:
	json.dump(emojis, fp)