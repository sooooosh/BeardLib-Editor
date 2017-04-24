Hooks:PreHook(Setup, "start_loading_screen", "BeardLibEditorStartLoadingScreen", function()
	if Global.level_data and Global.editor_mode then
		local level_tweak_data = tweak_data.levels[Global.level_data.level_id]
		if level_tweak_data then
			local gui_data = CoreGuiDataManager.GuiDataManager:new(LoadingEnvironmentScene:gui())
			local ws = gui_data:create_fullscreen_workspace()
			local panel = ws:panel():panel({name = "Load", layer = 50})
			panel:rect({
				name = "Background",
		       	color = Color(0.3, 0.3, 0.3),
			})
			Global.LoadingText = panel:text({
				name = "Loading",
				font = "fonts/font_large_mf",
				font_size = 42,
				color = Color(0.8, 0.8, 0.8),
				align = "center",
				vertical = "center",
			})
			BeardLibEditor:SetLoadingText("Waiting For Response")
			Global.level_data.editor_load = true
		end
	end
end)

Hooks:PreHook(Setup, "stop_loading_screen", "BeardLibEditorStopLoading", function()
	if managers.editor then
		managers.editor:animate_bg_fade()
	end
	Global.LoadingText = nil
end)

Hooks:PreHook(Setup, "init_managers", "BeardLibEditorInitManagersPre", function()
	if managers.editor then
		BeardLibEditor:SetLoadingText("Starting Loading Managers")
	end
end)

Hooks:PostHook(Setup, "init_managers", "BeardLibEditorInitManagers", function()
	if managers.editor then
		BeardLibEditor:SetLoadingText("Done Loading Managers")
	end
end)