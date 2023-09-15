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
		[":"] = "TrackWithNumber",
		["<down>"] = "NextTrack",
		["j"] = "NextTrack",
		["k"] = "PrevTrack",
		["<up>"] = "PrevTrack",
		["<C-f>"] = "Next10Track",
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
		["f"] = "Folder",
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
		["s"] = "toggleSoloExclusive",
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
		["<M-a>"] = "InsertAutomationItem",
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
		["0"] = "ProjectStart",
		["<TAB>"] = "NextTransientInItems",
		["<S-TAB>"] = "PrevTransientInItems",
		["<S-left>"] = "PrevMeasure",
		["<S-right>"] = "NextMeasure",
		["<CM-L>"] = "NextTransientInItemMinusFadeTime",
		["<CM-H>"] = "PrevTransientInItemMinusFadeTime",
		["B"] = "PrevBigItemStart",
		["E"] = "NextBigItemEnd",
		["W"] = "NextBigItemStart",
		["b"] = "PrevItemStart",
		["<M-b>"] = "SelPrevEnvelopePoint",
		["<M-w>"] = "SelNextEnvelopePoint",
		["<M-B>"] = "PrevEnvelopePoint",
		["<M-W>"] = "NextEnvelopePoint",
		["<M-n>"] = "AddNextEnvelopePointSel",
		["<M-N>"] = "AddPrevEnvelopePointSel",
		["e"] = "NextItemEnd",
		["w"] = "NextItemStart",
		["$"] = "LastItemEnd",
		["("] = "TimeSelectionStart",
		[")"] = "TimeSelectionEnd",
		["<S-down>"] = "PitchItemDownSemi",
		["<S-up>"] = "PitchItemUpSemi",
		["<CS-down>"] = "PitchItemDownOct",
		["<CS-up>"] = "PitchItemUpOct",
	},
	command = {
		["<M-D>"] = "DeleteEnvelopePoints",
		["<C-a>"] = "devAction",
		["<C-B>"] = "FadeItemInFromMouse",
		["<C-E>"] = "FadeItemOutFromMouse",
		["<C-y>"] = "SplitAtMouse",
		["<C-b>"] = "TrimLeftEdgeFromMouse",
		["<C-e>"] = "TrimRightEdgeFromMouse",
		["<ESC>"] = "Reset",
		[">"] = "TrimItemRightEdge",
		["<"] = "TrimItemLeftEdge",
		["<M-)>"] = "StretchItemEndToCursor",
		["<M-(>"] = "StretchItemStartToCursor",
		["<M-n>"] = "ShowNextFx",
		["<M-N>"] = "ShowPrevFx",
		["<M-f>"] = "ToggleShowFx",
		["<M-F>"] = "CloseFx",
		["<M-i>"] = "InsertEnvelopePoint",
		["<M-I>"] = "InsertToggleAtTimeSelection",
		["zp"] = "ZoomProject",
		["D"] = "CutSelectedItems",
		["Y"] = "CopySelectedItems",
		["<M-Y>"] = "CopySelectedEnvelopePoints",
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
		["zc"] = "CenterCursor",
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
				["b"] = "MediaExplorer",
				["A"] = { "+arrange", {
					["i"] = "ImplodeItemsOntoSingleTrack"
				} },
				["g"] = { "+grid",
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
				["z"] = {
					"+zoom/scroll",
					{
						["t"] = "ScrollToPlayPosition",
						["e"] = "ScrollToEditCursor",
					},
				},
				["m"] = {
					"+marker", {
					["i"] = "InsertProjectMarker",
					["w"] = "NextProjectMarker",
					["b"] = "PreviousProjectMarker",
					["t"] = { "+TakeMarkers", {
						["i"] = "InsertTakeMarker",
						["w"] = "NextTakeMarker",
						["b"] = "PrevTakeMarker",
					}
					}
				}
				},
				["M"] = {
					"+midi",
					{
						["g"] = "SetMidiGridDivision",
						["q"] = "Quantize",
						[","] = {
							"+options",
							{
								["g"] = "ToggleMidiEditorUsesMainGridDivision",
								["s"] = "ToggleMidiSnap",
							},
						},
					},
				},
				["r"] = {
					"+recording",
					{
						["a"] = "ArmTracks",
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
					"+selected items",
					{
						["<down>"] = "MoveItemDown",
						["<up>"] = "MoveItemUp",
						["p"] = "pasteRhythmToPitches",
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
						["q"] = "QuantizeItems",
						["h"] = "HealItemsSplits",
						["S"] = "ToggleSoloItem",
						["%"] = "SplitItemsAtNoteStart",
						["B"] = "MoveItemContentToEditCursor",
						["F"] = "Set2msFades",
						["x"] = {
							"+explode takes",
							{
								["p"] = "ExplodeTakesInPlace",
								["o"] = "ExplodeTakesInOrder",
								["a"] = "ExplodeTakesInAcrossTracks",
							},
						},
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
								["s"] = "ToggleShowTakeFxChain",
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
						["v"] = "RenameTrackToVstiPresetName",
						["n"] = "ResetTrackToNormal",
						["R"] = "RenderTrack",
						["r"] = "RenameTrack",
						["z"] = "MinimizeTracks",
						["m"] = "CycleRecordMonitor",
						["f"] = "CycleFolderState",
						["I"] = "SetTrackInputToMatchFirstSelected",
						["y"] = "SaveTrackAsTemplate",
						["+"] = "TrackVolumeUp3",
						["-"] = "TrackVolumeDown3",
						["i"] = {
							"+insert",
							{
								["c"] = "InsertClickTrack",
								["t"] = "InsertTrackFromTemplate",
								["v"] = "InsertVirtualInstrumentTrack",
								["1"] = "InsertTrackFromTemplateSlot1",
								["2"] = "InsertTrackFromTemplateSlot2",
								["3"] = "InsertTrackFromTemplateSlot3",
								["4"] = "InsertTrackFromTemplateSlot4",
							},
						},
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
						["h"] = "ToggleShowEnvelopesForTracks",
						["p"] = { "+point shapes",
							{
								["d"] = "DeleteEnvelopePoints",
								["b"] = "BezierPointShape",
								["e"] = "FastEndPointShape",
								["s"] = "FastStartPointShape",
								["l"] = "LinearPointShape",
								["E"] = "SlowStartEndPointShape",
								["S"] = "SquarePointShape",
							} },
						["I"] = "InsertToggleAtTimeSelection",
						["i"] = "InsertEnvelopePoint",
						["v"] = { "+point value",
							{
								["i"] = "InvertSelectedPoints",
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
								["y"] = "CopyEnvelope",
								["t"] = "ToggleShowSelectedEnvelope",
								["b"] = "ToggleEnvelopeBypass",
							},
						},
					},
				},

				["D"] = { "+dev", {
					["f"] = "FxDevices",
					["r"] = "Repl",
					["c"] = "commandIdLookup",
				} },
				["f"] = {
					"+fx",
					{
						["i"] = "InsertFxAtSlot",
						["a"] = "AddFx",
						["s"] = "ToggleShowFxChain",
						["d"] = "CutFxChain",
						["y"] = "CopyFxChain",
						["p"] = "PasteFxChain",
						["b"] = "ToggleFxBypass",
						["m"] = "ModulateLastTouchedFxParam",
						["I"] = {
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
				["T"] = {
					"+timeline",
					{
						["a"] = "AddTimeSignatureMarker",
						["e"] = "EditTimeSignatureMarker",
						["d"] = "DeleteTimeSignatureMarker",
						["s"] = "ToggleShowTempoEnvelope",
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
								["x"] = "RoutingMatrix",
								["w"] = "ToggleShowWiringDiagram",
								["t"] = "ToggleShowTrackManager",
								["m"] = "MasterTrack",
								["p"] = "RegionPlaylist",
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
								["v"] = "InsertVirtualInstrumentTrack",
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
						["B"] = "BuildBusses",
						["m"] = "RoutingMatrix",
						["R"] = "RouteToBusses",
						["b"] = "ProjectBay",
						[","] = "ShowProjectSettings",
						["n"] = "NextTab",
						["p"] = "PrevTab",
						["s"] = "SaveProject",
						["o"] = "OpenProject",
						["c"] = "NewProjectTab",
						["x"] = "CloseProject",
						["C"] = "CleanProjectDirectory",
						["S"] = "SaveProjectWithNewVersion",
						["t"] = {
							"+timebase",
							{
								["t"] = "SetProjectTimebaseToTime",
								["b"] = "SetProjectTimebaseToBeatsPos",
								["r"] = "SetProjectTimebaseToBeatsPosLengthAndRate",
							},
						},
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
						["e"] = "ExplodeNoteRows",
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
