return {
  timeline_selector = {
    ["s"] = "SelectedNotes",
  },
  timeline_operator = {
    ["d"] = "CutNotes",
    ["y"] = "CopyNotes",
    ["c"] = "FitNotes",
    ["a"] = "InsertNote",
    ["g"] = "JoinNotes",
    ["s"] = "SelectNotes",
    ["z"] = "MidiZoomTimeSelection",
  },
  timeline_motion = {
    ["l"] = "RightMidiGridDivision",
    ["h"] = "LeftMidiGridDivision",
    ["<right>"] = {"RightMidiGridDivision", "MoveNoteRight"},
    ["<left>"] = {"LeftMidiGridDivision", "MoveNoteLeft"},
    ["("] = "MidiTimeSelectionStart",
    [")"] = "MidiTimeSelectionEnd",
    ["w"] = "NextNoteStart",
    ["b"] = "PrevNoteStart",
    ["W"] = "NextNoteSamePitchStart",
    ["B"] = "PrevNoteSamePitchStart",
    ["e"] = "EventSelectionEnd",
    ["<up>"] = "MoveNoteUpSemitone",
    ["<down>"] = "MoveNoteDownSemitone",
    ["<S-up>"] = "MoveNoteUpOctave",
    ["<S-down>"] = "MoveNoteDownOctave",
    ["<S-right>"] = "LengthenNotes",
    ["<S-left>"] = "ShortenNotes",
  },
  command = {
    ["n"] = "AddNextNoteToSelection",
    ["N"] = "AddPrevNoteToSelection",
    ["+"] = "MidiZoomInVert",
    ["-"] = "MidiZoomOutVert",
    ["<C-+>"] = "MidiZoomInHoriz",
    ["<C-->"] = "MidiZoomOutHoriz",
    ["Z"] = "CloseWindow",
    ["p"] = "MidiPaste",
    ["S"] = "UnselectAllEvents",
    ["Y"] = "CopySelectedEvents",
    ["D"] = "CutSelectedEvents",
    ["k"] = "PitchUp",
    ["j"] = "PitchDown",
    ["K"] = "PitchUpOctave",
    ["zp"] = "MidiZoomContent",
    ["J"] = "PitchDownOctave",
    ["<C-b>"] = "PitchUpOctave",
    ["<C-f>"] = "PitchDownOctave",
    ["<C-u>"] = "PitchUp7",
    ["<C-d>"] = "PitchDown7",
    ["V"] = "SelectAllNotesAtPitch",
    ["<M-k>"] = "MoveNoteUpSemitone",
    ["<M-j>"] = "MoveNoteDownSemitone",
    ["<M-K>"] = "MoveNoteUpOctave",
    ["<M-J>"] = "MoveNoteDownOctave",
    ["<M-l>"] = "MoveNoteRight",
    ["<M-h>"] = "MoveNoteLeft",
  },
}

