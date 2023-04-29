camShake = false;
function onEvent(n,v1,v2)

	if n == "ChromaticAbberation" then
		if v1 == "1" then
			camShake = true;
			if flashingLights then
				addChromaticAbberationEffect('game', v2);
			end
		elseif v1 == "0" then
			clearEffects('game');
			clearShadersFromCamera('game');
			camShake = false;
			if flashingLights then
				cameraFlash('camGame', '000000', 0.25);
			end
		end
	end
end

function onUpdatePost(elapsed)
	if camShake then
		cameraShake('camGame', 0.015, 0.015);
	end
end
