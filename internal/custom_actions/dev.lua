local dev = {}

function dev.fxDevices()
  reaper.Main_OnCommand(reaper.NamedCommandLookup("_RSa0b0ec0b58437033fddcf576a71873629fafcdc7"), 0)
end

function dev.repl()
  reaper.Main_OnCommand(reaper.NamedCommandLookup("_RS9aebe6a6a706099d8a0af623f132ce89ed88ac10"), 0)
end

function dev.commandIdLookup()
  reaper.Main_OnCommand(
    reaper.NamedCommandLookup("_RS87865bad1f6c8e1d0edea2d722aabf96fdad47f3"), 0
  )
end

return dev
