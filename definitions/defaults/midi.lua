---@type Definition
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
		["<right>"] = "RightMidiGridDivision",
		["<left>"] = "LeftMidiGridDivision",
		["l"] = "MoveNoteAndCursorRight",
		["h"] = "MoveNoteAndCursorLeft",
		["("] = "MidiTimeSelectionStart",
		[")"] = "MidiTimeSelectionEnd",
		["w"] = "NextNoteStart",
		["b"] = "PrevNoteStart",
		["W"] = "NextBigNoteStart",
		["B"] = "PrevBigNoteStart",
		["E"] = "NextBigNoteEnd",
		["e"] = "NextNoteEnd",
		["<up>"] = "MoveNoteUpSemitone",
		["<down>"] = "MoveNoteDownSemitone",
		["<S-up>"] = "MoveNoteUpOctave",
		["<S-down>"] = "MoveNoteDownOctave",
		["<S-right>"] = "LengthenNotes",
		["<S-left>"] = "ShortenNotes",
		["n"] = "AddNextNoteToSelection",
		["N"] = "AddPrevNoteToSelection",
		["<TAB>"] = "JumpToNextNote",
		["<S-TAB>"] = "JumpToPrevNote",
		["<C-w>"] = "ActivateNextMidiTrack",
		["<C-W>"] = "ActivatePrevMidiTrack",
	},
	command = {
		["<ESC>"] = "ResetMidi",
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
		["V"] = "SelectAllNotesAtPitch",
		["<M-k>"] = "MoveNoteUpSemitone",
		["<M-j>"] = "MoveNoteDownSemitone",
		["<M-K>"] = "MoveNoteUpOctave",
		["<M-J>"] = "MoveNoteDownOctave",
		["<SPC>"] = {
			"+leader commands",
			{
				["q"] = "CloseUndockedMidiEditorOrPassToMainWindow",
				["<SPC>"] = "ShowMidiActionList",
				["m"] = {
					"+midi",
					{
						["g"] = "SetMidiGridDivision",
						["q"] = "Quantize",
					},
				},
				["c"] = { "+CCs", {
					["t"] = "ToggleUsedCC",
				} },
				["v"] = {
					"+view",
					{
						["d"] = "DrumsView",
						["e"] = "EventView",
						["n"] = "NotationView",
						["p"] = "PianoRollView",
					},
				},
			},
		},
		["<M-g>"] = "InsertG",
		["<M-s>"] = "InsertGb",
		["<M-f>"] = "InsertF",
		["<M-e>"] = "InsertE",
		["<M-m>"] = "InsertEb",
		["<M-d>"] = "InsertD",
		["<M-r>"] = "InsertDb",
		["<M-c>"] = "InsertC",
		["<M-b>"] = "InsertB",
		["<M-h>"] = "InsertBb",
		["<M-a>"] = "InsertA",
		["<M-l>"] = "InsertAb",
		["<M-G>"] = "InsertChordG",
		["<M-S>"] = "InsertChordGb",
		["<M-F>"] = "InsertChordF",
		["<M-E>"] = "InsertChordE",
		["<M-M>"] = "InsertChordEb",
		["<M-D>"] = "InsertChordD",
		["<M-R>"] = "InsertChordDb",
		["<M-C>"] = "InsertChordC",
		["<M-B>"] = "InsertChordB",
		["<M-H>"] = "InsertChordBb",
		["<M-A>"] = "InsertChordA",
		["<M-L>"] = "InsertChordAb",
	},
}
