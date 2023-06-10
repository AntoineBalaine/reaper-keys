return {
  timeline_motion = {
    ["0"] = "ProjectStart",
    ["f"] = "PlayPosition",
    -- ["x"] = "MousePosition",
    -- ["<M-h>"] = "Left10Pix",
    -- ["<M-l>"] = "Right10Pix",
    ["h"] = "LeftGridDivision",
    ["<left>"] = "LeftGridDivision",
    ["l"] = "RightGridDivision",
    ["<right>"] = "RightGridDivision",
    ["H"] = "PrevMeasure",
    ["L"] = "NextMeasure",
    ["<C-H>"] = "Prev4Measures",
    ["<C-L>"] = "Next4Measures",
    ["`"] = "MarkedTimelinePosition",
  },
  timeline_operator = {
    ["r"] = "Record",
    ["<C-p>"] = "DuplicateTimeline",
    ["t"] = "PlayAndLoop",
    ["|"] = "CreateMeasures",
    ["<C-|>"] = "CreateProjectTempo"
  },
  timeline_selector = {
    ["~"] = "MarkedRegion",
    ["!"] = "LoopSelection",
    ["i"] = {"+inner", {
               ["<M-w>"] = "AutomationItem",
               ["l"] = "AllTrackItems",
               ["r"] = "Region",
               ["p"] = "ProjectTimeline",
               ["w"] = "Item",
               ["W"] = "BigItem",
    }},
  },
  visual_timeline_command = {
    ["o"] = "SwitchTimelineSelectionSide",
  },
  command = {
    ["<M-+>"] = "IncreaseGrid",
    ["<M-->"] = "DecreaseGrid",
    ["<C-s>"] = "SaveProject",
    ["."] = "RepeatLastCommand",
    ["@"] = "PlayMacro",
    [","] = "RecordMacro",
    ["m"] = "Mark",
    ["~"] = "MarkedRegion",
    ["<C-'>"] = "DeleteMark",
    ["<C-r>"] = "Redo",
    ["u"] = "Undo",
    ["R"] = "ToggleRecord",
    ["T"] = "Play",
    ["tt"] = "PlayFromTimeSelectionStart",
    ["<M-t>"] = "PlayFromMousePosition",
    ["<M-T>"] = "PlayFromMouseAndSoloTrack",
    ["F"] = "Pause",
    ["<C-z>"] = "ZoomUndo",
    ["<C-Z>"] = "ZoomRedo",
    ["v"] = "SetModeVisualTimeline",
    ["<M-v>"] = "ClearTimelineSelectionAndSetModeVisualTimeline",
    ["<C-SPC>"] = "ToggleViewMixer",
    ["<ESC>"] = "Reset",
    ["<return>"] = "StartStop",
    ["X"] = "MoveToMousePositionAndPlay",
    ["dr"] = "RemoveRegion",
    ["!"] = "ToggleLoop",
    ["<CM-f>"] = "MidiLearnLastTouchedFxParam",
    ["<CM-m>"] = "ModulateLastTouchedFxParam",
    ["<M-x>"] = "ShowBindingList",
    ["<C-m>"] = "TapTempo",
    ["q"] = {"+options", {
               ["p"] = "TogglePlaybackPreroll",
               ["r"] = "ToggleRecordingPreroll",
               ["z"] = "TogglePlaybackAutoScroll",
               ["v"] = "ToggleLoopSelectionFollowsTimeSelection",
               ["s"] = "ToggleSnap",
               ["m"] = "ToggleMetronome",
               ["t"] = "ToggleStopAtEndOfTimeSelectionIfNoRepeat",
               ["x"] = "ToggleAutoCrossfade",
               ["e"] = "ToggleEnvelopePointsMoveWithItems",
               ["c"] = "CycleRippleEditMode",
               ["f"] = "ResetFeedbackWindow",
    }},
  },
}
