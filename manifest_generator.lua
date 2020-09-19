require("buildData.config")

local rawXmlLocation = usesMicrophone and "rawMic.xml" or "raw.xml"
local raw, msg = io.open(rawXmlLocation, 'r')

assert(raw, msg)
local data = raw:read('a')

raw:close()

print("____DATA FROM CONFIG____")

print(packageName)
print(versionCode)
print(versionSemantic)
print(gameName)
print("Micronphone? "..tostring(usesMicrophone))

print("\n\n\n")

data = data:gsub("${GamePackageName}", packageName)
data = data:gsub("${GameVersionCode}", versionCode)
data = data:gsub("${GameVersionSemantic}", versionSemantic)
data = data:gsub("${GameName}", gameName)

print("_____MANIFEST AFTER GSUBS____")
print(data)
print("\n\n\n")

local gen, msg = io.open("gen.xml", 'w+')
assert(gen, msg)

gen:write(data)
gen:flush()
gen:close()

print("DATA WRITTEN!")

os.exit(0)
