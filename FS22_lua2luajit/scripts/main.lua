local baseDirectory = g_currentModDirectory
local inputDirectory = baseDirectory .. "input/"
local outputDirectory = baseDirectory .. "output/"

local files = Files.new(inputDirectory)

for _, v in pairs(files.files) do
	if not v.isDirectory then
		if string.endsWith(v.filename, ".lua") then
			local inputPath = inputDirectory .. v.filename
			local binary = string.dump(loadfile(inputPath))

			if binary ~= nil then
				print("Loaded file: " .. inputPath)

				local outputPath = outputDirectory .. v.filename
				local file = io.open(outputPath, "w")

				file:write(binary)
				file:close()

				print("File saved: " .. outputPath)
			end
		end
	end
end