return {
	track_motion = {
		["G"] = "LastTrack",
		["gg"] = "FirstTrack",
		["J"] = "NextFolderNear",
		["K"] = "PrevFolderNear",
		["/"] = "MatchedTrackForward",
		["?"] = "MatchedTrackBackward",
		["n"] = "NextTrackMatchForward",
		["N"] = "NextTrackMatchBackward",
		["j"] = "NextTrack",
		[":"] = "TrackWithNumber",
		["<down>"] = "NextTrack",
		["k"] = "PrevTrack",
		["<up>"] = "PrevTrack",
		["<C-d>"] = "Next5Track",
		["<C-u>"] = "Prev5Track",
		["t"] = "CurrentTrack",
	},
	visual_track_command = {
		["V"] = "SetModeNormal",
		["<C-h>"] = "NudgeTrackPanLeft",
		["<C-l>"] = "NudgeTrackPanRight",
		["<C-H>"] = "NudgeTrackPanLeft10Times",
		["<C-L>"] = "NudgeTrackPanRight10Times",
		["<M-i>"] = "InsertEnvelopePointsAtSelection",
	},
	track_selector = {
		["'"] = "MarkedTracks",
		["F"] = "FolderParent",
		["i"] = {
			"+inner",
			{
				["c"] = "InnerFolder",
				["f"] = "InnerFolderAndParent",
				["g"] = "AllTracks",
			},
		},
	},
	track_operator = {
		['"'] = {
			"+snapshots",
			{
				["s"] = "SaveTracksToCurrentSnapshot",
				["c"] = "CreateNewSnapshotWithTracks",
				["d"] = "DeleteTracksFromCurrentSnapshot",
			},
		},
		["z"] = "ZoomTrackSelection",
		["<TAB>"] = "MakeFolder",
		["d"] = "CutTrack",
		["a"] = "ArmTracks",
		["s"] = "SelectTracks",
		["S"] = "ToggleSolo",
		["M"] = "ToggleMute",
		["y"] = "CopyTrack",
		["<M-C>"] = "ColorTrackGradient",
		["<M-c>"] = "ColorTrack",
	},
	timeline_operator = {
		["s"] = "SelectItems",
		["<M-p>"] = "CopyAndFitByLooping",
		["<M-s>"] = "SelectEnvelopePoints",
		["d"] = "CutItems",
		["y"] = "CopyItems",
		["<C-c>"] = "CopyItems",
		["<M-d>"] = "CutEnvelopePoints",
		["<M-y>"] = "CopyEnvelopePoints",
		["<C-D>"] = "DeleteTimeline",
		["g"] = "GlueItems",
		["#"] = "SetItemFadeBoundaries",
		["z"] = "ZoomTimeSelection",
		["Z"] = "ZoomTimeAndTrackSelection",
		["i"] = "InsertOrExtendMidiItem",
		["c"] = {
			"+change/fit",
			{
				["a"] = "InsertOrExtendMidiItem",
				["c"] = "FitByLoopingNoExtend",
				["f"] = "FitByLooping",
				["p"] = "FitByPadding",
				["s"] = "FitByStretching",
			},
		},
	},
	timeline_selector = {
		["s"] = "SelectedItems",
	},
	timeline_motion = {
		["<TAB>"] = "NextTransientInItems",
		["<S-TAB>"] = "PrevTransientInItems",
		["<S-left>"] = "PrevMeasure",
		["<S-right>"] = "NextMeasure",
		["B"] = "PrevBigItemStart",
		["E"] = "NextBigItemEnd",
		["W"] = "NextBigItemStart",
		["b"] = "PrevItemStart",
		["e"] = "NextItemEnd",
		["w"] = "NextItemStart",
		["$"] = "LastItemEnd",
		["<S-down>"] = "PitchItemDownSemi",
		["<S-up>"] = "PitchItemUpSemi",
		["<CS-down>"] = "PitchItemDownOct",
		["<CS-up>"] = "PitchItemUpOct",
	},
	command = {
		["<ESC>"] = "Reset",
		["<M-n>"] = "ShowNextFx",
		["<M-N>"] = "ShowPrevFx",
		["<M-f>"] = "ToggleShowFx",
		["<M-F>"] = "CloseFx",
		["<M-i>"] = "InsertEnvelopePoint",
		["zp"] = "ZoomProject",
		["D"] = "CutSelectedItems",
		["Y"] = "CopySelectedItems",
		["V"] = "SetModeVisualTrack",
		["<C-w>"] = "NextEnvelope",
		["<C-W>"] = "PrevEnvelope",
		["<M-j>"] = "NextEnvelope",
		["<M-k>"] = "PrevEnvelope",
		["<C-+>"] = "ZoomInVert",
		["<C-->"] = "ZoomOutVert",
		["+"] = "ZoomInHoriz",
		["-"] = "ZoomOutHoriz",
		[";"] = "MoveItemToEditCursor",
		["dd"] = "CutTrack",
		["aa"] = "ArmTracks",
		["O"] = "EnterTrackAbove",
		["o"] = "EnterTrackBelow",
		["p"] = "Paste",
		["<C-v>"] = "Paste",
		["yy"] = "CopyTrack",
		["zz"] = "ScrollToSelectedTracks",
		["%"] = "SplitItemsAtEditCursor",
		["~"] = "MarkedTracks",
		["<C-j>"] = "NudgeTrackVolumeDownBy1Tenth",
		["<C-k>"] = "NudgeTrackVolumeUpBy1Tenth",
		["<C-J>"] = "NudgeTrackVolumeDownBy1",
		["<C-K>"] = "NudgeTrackVolumeUpBy1",
		["<CM-j>"] = "ShiftEnvelopePointsDownATinyBit",
		["<CM-k>"] = "ShiftEnvelopePointsUpATinyBit",
		["<CM-J>"] = "ShiftEnvelopePointsDown",
		["<CM-K>"] = "ShiftEnvelopePointsUp",
		["<M-S>"] = "SelectItemsUnderEditCursor",
		["'"] = "MarkedTracks",
		["<SPC>"] = {
			"+leader commands",
			{
				["<SPC>"] = "ShowActionList",
				["B"] = "MediaExplorer",
				["g"] = {
					"+grid",
					{
						["d"] = "SetGridDivision",
						["s"] = "ToggleSnap",
					}
				},
				["o"] = {
					"+options",
					{
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
					},
				},
				["m"] = {
					"+midi",
					{
						["g"] = "SetMidiGridDivision",
						["q"] = "Quantize",
					},
				},
				["r"] = {
					"+recording",
					{
						["o"] = "SetRecordMidiOutput",
						["d"] = "SetRecordMidiOverdub",
						["t"] = "SetRecordMidiTouchReplace",
						["R"] = "SetRecordMidiReplace",
						["v"] = "SetRecordMonitorOnly",
						["r"] = "SetRecordInput",
						[","] = {
							"+options",
							{
								["n"] = "SetRecordModeNormal",
								["s"] = "SetRecordModeItemSelectionAutoPunch",
								["v"] = "SetRecordModeTimeSelectionAutoPunch",
								["p"] = "ToggleRecordingPreroll",
								["z"] = "ToggleRecordingAutoScroll",
								["t"] = "ToggleRecordToTapeMode",
							},
						},
					},
				},
				["a"] = {
					"+automation",
					{
						["r"] = "SetAutomationModeTrimRead",
						["R"] = "SetAutomationModeRead",
						["l"] = "SetAutomationModeLatch",
						["g"] = "SetAutomationModeLatchAndArm",
						["p"] = "SetAutomationModeLatchPreview",
						["t"] = "SetAutomationModeTouch",
						["w"] = "SetAutomationModeWrite",
					},
				},
				["i"] = {
					"+items",
					{
						["P"] = "PasteItemBeforeCursor",
						["j"] = "NextTake",
						["k"] = "PrevTake",
						["l"] = "LoopItem",
						["M"] = "ToggleMuteItem",
						["d"] = "DeleteActiveTake",
						["c"] = "CropToActiveTake",
						["o"] = "OpenInMidiEditor",
						["n"] = "ItemNormalize",
						["g"] = "GlueItemsIgnoringTimeSelection",
						["F"] = "Set2msFades",
						["s"] = {
							"+stretch",
							{
								["a"] = "AdjustTransientDetection",
								["c"] = "ClearTransientsAndStretchMarkers",
								["d"] = "DeleteStretchMarker",
								["i"] = "InsertStretchMarker",
								["s"] = "SplitItemAtTransients",
								["t"] = "CalculateTransientGuides",
								["D"] = "DynamicSplit",
							},
						},
						["x"] = {
							"+explode takes",
							{
								["p"] = "ExplodeTakesInPlace",
								["o"] = "ExplodeTakesInOrder",
								["a"] = "ExplodeTakesInAcrossTracks",
							},
						},
						["#"] = {
							"+fade",
							{
								["i"] = "CycleItemFadeInShape",
								["o"] = "CycleItemFadeOutShape",
							},
						},
						["t"] = {
							"+transients",
							{
							},
						},
						["e"] = {
							"+envelopes",
							{
								["s"] = "ViewTakeEnvelopes",
								["m"] = "ToggleTakeMuteEnvelope",
								["p"] = "ToggleTakePanEnvelope",
								["P"] = "ToggleTakePitchEnvelope",
								["v"] = "ToggleTakeVolumeEnvelope",
							},
						},
						["f"] = {
							"+fx",
							{
								["a"] = "ApplyFxToItem",
								["p"] = "PasteItemFxChain",
								["d"] = "CutItemFxChain",
								["y"] = "CopyItemFxChain",
								["c"] = "ToggleShowTakeFxChain",
								["b"] = "ToggleTakeFxBypass",
							},
						},
						["r"] = "ReverseItems",
						["R"] = {
							"+rename",
							{
								["s"] = "RenameTakeSourceFile",
								["t"] = "RenameTake",
								["r"] = "RenameTakeAndSourceFile",
								["a"] = "AutoRenameTake",
							},
						},
						["b"] = {
							"+timebase",
							{
								["t"] = "SetItemsTimebaseToTime",
								["b"] = "SetItemsTimebaseToBeatsPos",
								["r"] = "SetItemsTimebaseToBeatsPosLengthAndRate",
							},
						},
					},
				},
				["t"] = {
					"+track",
					{
						["R"] = "RenderTrack",
						["r"] = "RenameTrack",
						["m"] = "CycleRecordMonitor",
						["f"] = "CycleFolderState",
						["y"] = "SaveTrackAsTemplate",
						["p"] = "InsertTrackFromTemplate",
						["1"] = "InsertTrackFromTemplateSlot1",
						["2"] = "InsertTrackFromTemplateSlot2",
						["3"] = "InsertTrackFromTemplateSlot3",
						["4"] = "InsertTrackFromTemplateSlot4",
						["c"] = "InsertClickTrack",
						["V"] = "TrackVolumeUp3",
						["v"] = "TrackVolumeDown3",
						["x"] = {
							"+routing",
							{
								["p"] = "TrackToggleSendToParent",
								["s"] = "ToggleShowTrackRouting",
							},
						},
						["F"] = {
							"+freeze",
							{
								["f"] = "FreezeTrack",
								["u"] = "UnfreezeTrack",
								["s"] = "ShowTrackFreezeDetails",
							},
						},
					},
				},
				["e"] = {
					"+envelopes",
					{
						["p"] = { "+point shapes",
							{
								["b"] = "BezierPointShape",
								["e"] = "FastEndPointShape",
								["s"] = "FastStartPointShape",
								["l"] = "LinearPointShape",
								["E"] = "SlowStartEndPointShape",
								["S"] = "SquarePointShape",
							} },
						["i"] = "InsertEnvelopePoint",
						["v"] = { "+point value",
							{
								["-"] = "MoveEnvelopePointDown",
								["+"] = "MoveEnvelopePointUp",
								["m"] = "SetPointMin",
								["M"] = "SetPointMax",
								["c"] = "SetPointCenter",
							}
						},
						["t"] = "ToggleShowAllEnvelope",
						["a"] = "ToggleArmAllEnvelopes",
						["A"] = "UnarmAllEnvelopes",
						["d"] = "ClearAllEnvelope",
						["V"] = "ToggleVolumeEnvelope",
						["P"] = "TogglePanEnvelope",
						["w"] = "SelectWidthEnvelope",
						["l"] = "ShowEnvelopeLastTouchedFxParam",
						["s"] = {
							"+selected",
							{
								["d"] = "ClearEnvelope",
								["a"] = "ToggleArmEnvelope",
								["t"] = "ToggleShowSelectedEnvelope",
							},
						},
					},
				},
				["f"] = {
					"+fx",
					{
						["a"] = "AddFx",
						["s"] = "ToggleShowFxChain",
						["d"] = "CutFxChain",
						["y"] = "CopyFxChain",
						["p"] = "PasteFxChain",
						["b"] = "ToggleFxBypass",
						["i"] = {
							"+input",
							{
								["s"] = "ToggleShowInputFxChain",
								["d"] = "CutInputFxChain",
							},
						},
						["c"] = {
							"+show",
							{
								["1"] = "ToggleShowFx1",
								["2"] = "ToggleShowFx2",
								["3"] = "ToggleShowFx3",
								["4"] = "ToggleShowFx4",
								["5"] = "ToggleShowFx5",
								["6"] = "ToggleShowFx6",
								["7"] = "ToggleShowFx7",
								["8"] = "ToggleShowFx8",
							},
						},
					},
				},
				["G"] = {
					"+global",
					{
						["q"] = "QuitReaper",
						["g"] = "SetGridDivision",
						["r"] = "ResetControlDevices",
						[","] = "ShowPreferences",
						["S"] = "UnsoloAllItems",
						["s"] = {
							"+show/hide",
							{
								["x"] = "ToggleShowRoutingMatrix",
								["w"] = "ToggleShowWiringDiagram",
								["t"] = "ToggleShowTrackManager",
								["m"] = "ShowMasterTrack",
								["M"] = "HideMasterTrack",
								["r"] = "ToggleShowRegionMarkerManager",
							},
						},
						["f"] = {
							"+fx",
							{
								["x"] = "CloseAllFxChainsAndWindows",
								["c"] = "ViewFxChainMaster",
							},
						},
						["e"] = {
							"+envelope",
							{
								["t"] = "ToggleShowAllEnvelopeGlobal",
							},
						},
						["t"] = {
							"+track",
							{
								["t"] = "ToggleAutomaticRecordArm",
								["a"] = "ClearAllRecordArm",
								["s"] = "UnsoloAllTracks",
								["m"] = "UnmuteAllTracks",
							},
						},
						["a"] = {
							"+automation",
							{
								["r"] = "SetGlobalAutomationModeTrimRead",
								["l"] = "SetGlobalAutomationModeLatch",
								["p"] = "SetGlobalAutomationModeLatchPreview",
								["t"] = "SetGlobalAutomationModeTouch",
								["R"] = "SetGlobalAutomationModeRead",
								["w"] = "SetGlobalAutomationModeWrite",
								["S"] = "SetGlobalAutomationModeOff",
							},
						},
					},
				},
				["p"] = {
					"+project",
					{
						[","] = "ShowProjectSettings",
						["n"] = "NextTab",
						["p"] = "PrevTab",
						["s"] = "SaveProject",
						["o"] = "OpenProject",
						["c"] = "NewProjectTab",
						["x"] = "CloseProject",
						["C"] = "CleanProjectDirectory",
						["S"] = "SaveProjectWithNewVersion",
						["r"] = {
							"+render",
							{
								["."] = "RenderProjectWithLastSetting",
								["r"] = "RenderProject",
							},
						},
					},
				},
				["d"] = {
					"+drums",
					{
						["f"] = "Flam",
						["3"] = "Ras3",
						["5"] = "Ras5",
						["c"] = "Crescendo",
						["d"] = "Decrescendo",
						["D"] = "DynamicSplit",
						["q"] = "QuantizeTool",
					}
				},
			},
		},
	},
}
