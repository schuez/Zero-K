--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  file:    camera_shake.lua
--  brief:   Camera shakes
--  author:  Dave Rodgers
--
--  Copyright (C) 2007.
--  Licensed under the terms of the GNU GPL, v2 or later.
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function widget:GetInfo()
  return {
    name      = "CameraShake",
    desc      = "Camera shakes",
    author    = "trepan",
    date      = "Jun 15, 2007",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

-- Automatically generated local definitions

local spSetCameraOffset      = Spring.SetCameraOffset
local spSetShockFrontFactors = Spring.SetShockFrontFactors


--------------------------------------------------------------------------------
----------------------------Configuration---------------------------------------
options_path = 'Settings/Camera'
options_order = { 'camShake'}
options = {
	camShake = {
		name = 'Camera Shake (when explosions occur)',
		type = "number", 
		value = 0.5, 
		min = 0,
		max = 1,
		step = 0.01,
	},
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
	

local exps = 0
local shake = 0

local powerScale = 200

local decayFactor = 5

local minArea  = 32  -- weapon's area of effect
local minPower = (0.02 / powerScale)
local distAdj  = 100


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


function widget:Initialize()
  -- required for ShockFront() call-ins
  -- (threshold uses the 1/d^2 power)
  spSetShockFrontFactors(minArea, minPower, distAdj)
end


function widget:Shutdown()
  spSetCameraOffset()
end


function widget:ShockFront(power, dx, dy, dz)
  exps = exps + 1
  power = power * powerScale
  if (power > 10) then
    power = 10
  end
  shake = shake + power
end

function WG.ShakeCamera(power)
  shake = shake + power
end

local function birand(val)
  return val * (1.0 - (0.002 * math.random(1000)))
end


function widget:Update(dt)
  if options.camShake.value == 0 then
    return
  end
  local t = widgetHandler:GetHourTimer()
  local pShake = shake * 0.2 * options.camShake.value
  local tShake = shake * 0.05 * options.camShake.value
  local px, py, pz, tx, ty, tz =
    birand(pShake),
    birand(pShake),
    birand(pShake),
    birand(tShake),
    birand(tShake)
  spSetCameraOffset(px, py, pz, tx, ty)

  local decay = (1 - (decayFactor * dt))
  if (decay < 0) then
    decay = 0
  end
  shake = shake * decay
end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
