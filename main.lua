--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]

local ____modules = {}
local ____moduleCache = {}
local ____originalRequire = require
local function require(file, ...)
    if ____moduleCache[file] then
        return ____moduleCache[file].value
    end
    if ____modules[file] then
        local module = ____modules[file]
        ____moduleCache[file] = { value = (select("#", ...) > 0) and module(...) or module(file) }
        return ____moduleCache[file].value
    else
        if ____originalRequire then
            return ____originalRequire(file)
        else
            error("module '" .. file .. "' not found")
        end
    end
end
____modules = {
["event"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
-- Lua Library inline imports
local function __TS__Class(self)
    local c = {prototype = {}}
    c.prototype.__index = c.prototype
    c.prototype.constructor = c
    return c
end

local function __TS__New(target, ...)
    local instance = setmetatable({}, target.prototype)
    instance:____constructor(...)
    return instance
end

local function __TS__ArrayIsArray(value)
    return type(value) == "table" and (value[1] ~= nil or next(value) == nil)
end

local function __TS__ArrayConcat(self, ...)
    local items = {...}
    local result = {}
    local len = 0
    for i = 1, #self do
        len = len + 1
        result[len] = self[i]
    end
    for i = 1, #items do
        local item = items[i]
        if __TS__ArrayIsArray(item) then
            for j = 1, #item do
                len = len + 1
                result[len] = item[j]
            end
        else
            len = len + 1
            result[len] = item
        end
    end
    return result
end

local function __TS__ArraySlice(self, first, last)
    local len = #self
    first = first or 0
    if first < 0 then
        first = len + first
        if first < 0 then
            first = 0
        end
    else
        if first > len then
            first = len
        end
    end
    last = last or len
    if last < 0 then
        last = len + last
        if last < 0 then
            last = 0
        end
    else
        if last > len then
            last = len
        end
    end
    local out = {}
    first = first + 1
    last = last + 1
    local n = 1
    while first < last do
        out[n] = self[first]
        first = first + 1
        n = n + 1
    end
    return out
end

local __TS__Symbol, Symbol
do
    local symbolMetatable = {__tostring = function(self)
        return ("Symbol(" .. (self.description or "")) .. ")"
    end}
    function __TS__Symbol(description)
        return setmetatable({description = description}, symbolMetatable)
    end
    Symbol = {
        asyncDispose = __TS__Symbol("Symbol.asyncDispose"),
        dispose = __TS__Symbol("Symbol.dispose"),
        iterator = __TS__Symbol("Symbol.iterator"),
        hasInstance = __TS__Symbol("Symbol.hasInstance"),
        species = __TS__Symbol("Symbol.species"),
        toStringTag = __TS__Symbol("Symbol.toStringTag")
    }
end

local function __TS__InstanceOf(obj, classTbl)
    if type(classTbl) ~= "table" then
        error("Right-hand side of 'instanceof' is not an object", 0)
    end
    if classTbl[Symbol.hasInstance] ~= nil then
        return not not classTbl[Symbol.hasInstance](classTbl, obj)
    end
    if type(obj) == "table" then
        local luaClass = obj.constructor
        while luaClass ~= nil do
            if luaClass == classTbl then
                return true
            end
            luaClass = luaClass.____super
        end
    end
    return false
end
-- End of Lua Library inline imports
local ____exports = {}
____exports.CharEvent = __TS__Class()
local CharEvent = ____exports.CharEvent
CharEvent.name = "CharEvent"
function CharEvent.prototype.____constructor(self)
    self.character = ""
end
function CharEvent.prototype.get_name(self)
    return "char"
end
function CharEvent.prototype.get_args(self)
    return {self.character}
end
function CharEvent.init(self, args)
    if not (type(args[1]) == "string") or args[1] ~= "char" then
        return nil
    end
    local ev = __TS__New(____exports.CharEvent)
    ev.character = args[2]
    return ev
end
____exports.KeyEvent = __TS__Class()
local KeyEvent = ____exports.KeyEvent
KeyEvent.name = "KeyEvent"
function KeyEvent.prototype.____constructor(self)
    self.key = 0
    self.isHeld = false
    self.isUp = false
end
function KeyEvent.prototype.get_name(self)
    return self.isUp and "key_up" or "key"
end
function KeyEvent.prototype.get_args(self)
    local ____self_key_1 = self.key
    local ____table_isUp_0
    if self.isUp then
        ____table_isUp_0 = nil
    else
        ____table_isUp_0 = self.isHeld
    end
    return {____self_key_1, ____table_isUp_0}
end
function KeyEvent.init(self, args)
    if not (type(args[1]) == "string") or args[1] ~= "key" and args[1] ~= "key_up" then
        return nil
    end
    local ev = __TS__New(____exports.KeyEvent)
    ev.key = args[2]
    ev.isUp = args[1] == "key_up"
    local ____ev_3 = ev
    local ____ev_isUp_2
    if ev.isUp then
        ____ev_isUp_2 = false
    else
        ____ev_isUp_2 = args[3]
    end
    ____ev_3.isHeld = ____ev_isUp_2
    return ev
end
____exports.PasteEvent = __TS__Class()
local PasteEvent = ____exports.PasteEvent
PasteEvent.name = "PasteEvent"
function PasteEvent.prototype.____constructor(self)
    self.text = ""
end
function PasteEvent.prototype.get_name(self)
    return "paste"
end
function PasteEvent.prototype.get_args(self)
    return {self.text}
end
function PasteEvent.init(self, args)
    if not (type(args[1]) == "string") or args[1] ~= "paste" then
        return nil
    end
    local ev = __TS__New(____exports.PasteEvent)
    ev.text = args[2]
    return ev
end
____exports.TimerEvent = __TS__Class()
local TimerEvent = ____exports.TimerEvent
TimerEvent.name = "TimerEvent"
function TimerEvent.prototype.____constructor(self)
    self.id = 0
    self.isAlarm = false
end
function TimerEvent.prototype.get_name(self)
    return self.isAlarm and "alarm" or "timer"
end
function TimerEvent.prototype.get_args(self)
    return {self.id}
end
function TimerEvent.init(self, args)
    if not (type(args[1]) == "string") or args[1] ~= "timer" and args[1] ~= "alarm" then
        return nil
    end
    local ev = __TS__New(____exports.TimerEvent)
    ev.id = args[2]
    ev.isAlarm = args[1] == "alarm"
    return ev
end
____exports.TaskCompleteEvent = __TS__Class()
local TaskCompleteEvent = ____exports.TaskCompleteEvent
TaskCompleteEvent.name = "TaskCompleteEvent"
function TaskCompleteEvent.prototype.____constructor(self)
    self.id = 0
    self.success = false
    self.error = nil
    self.params = {}
end
function TaskCompleteEvent.prototype.get_name(self)
    return "task_complete"
end
function TaskCompleteEvent.prototype.get_args(self)
    if self.success then
        return __TS__ArrayConcat({self.id, self.success}, self.params)
    else
        return {self.id, self.success, self.error}
    end
end
function TaskCompleteEvent.init(self, args)
    if not (type(args[1]) == "string") or args[1] ~= "task_complete" then
        return nil
    end
    local ev = __TS__New(____exports.TaskCompleteEvent)
    ev.id = args[2]
    ev.success = args[3]
    if ev.success then
        ev.error = nil
        ev.params = __TS__ArraySlice(args, 3)
    else
        ev.error = args[4]
        ev.params = {}
    end
    return ev
end
____exports.RedstoneEvent = __TS__Class()
local RedstoneEvent = ____exports.RedstoneEvent
RedstoneEvent.name = "RedstoneEvent"
function RedstoneEvent.prototype.____constructor(self)
end
function RedstoneEvent.prototype.get_name(self)
    return "redstone"
end
function RedstoneEvent.prototype.get_args(self)
    return {}
end
function RedstoneEvent.init(self, args)
    if not (type(args[1]) == "string") or args[1] ~= "redstone" then
        return nil
    end
    local ev = __TS__New(____exports.RedstoneEvent)
    return ev
end
____exports.TerminateEvent = __TS__Class()
local TerminateEvent = ____exports.TerminateEvent
TerminateEvent.name = "TerminateEvent"
function TerminateEvent.prototype.____constructor(self)
end
function TerminateEvent.prototype.get_name(self)
    return "terminate"
end
function TerminateEvent.prototype.get_args(self)
    return {}
end
function TerminateEvent.init(self, args)
    if not (type(args[1]) == "string") or args[1] ~= "terminate" then
        return nil
    end
    local ev = __TS__New(____exports.TerminateEvent)
    return ev
end
____exports.DiskEvent = __TS__Class()
local DiskEvent = ____exports.DiskEvent
DiskEvent.name = "DiskEvent"
function DiskEvent.prototype.____constructor(self)
    self.side = ""
    self.eject = false
end
function DiskEvent.prototype.get_name(self)
    return self.eject and "disk_eject" or "disk"
end
function DiskEvent.prototype.get_args(self)
    return {self.side}
end
function DiskEvent.init(self, args)
    if not (type(args[1]) == "string") or args[1] ~= "disk" and args[1] ~= "disk_eject" then
        return nil
    end
    local ev = __TS__New(____exports.DiskEvent)
    ev.side = args[2]
    ev.eject = args[1] == "disk_eject"
    return ev
end
____exports.PeripheralEvent = __TS__Class()
local PeripheralEvent = ____exports.PeripheralEvent
PeripheralEvent.name = "PeripheralEvent"
function PeripheralEvent.prototype.____constructor(self)
    self.side = ""
    self.detach = false
end
function PeripheralEvent.prototype.get_name(self)
    return self.detach and "peripheral_detach" or "peripheral"
end
function PeripheralEvent.prototype.get_args(self)
    return {self.side}
end
function PeripheralEvent.init(self, args)
    if not (type(args[1]) == "string") or args[1] ~= "peripheral" and args[1] ~= "peripheral_detach" then
        return nil
    end
    local ev = __TS__New(____exports.PeripheralEvent)
    ev.side = args[2]
    ev.detach = args[1] == "peripheral_detach"
    return ev
end
____exports.RednetMessageEvent = __TS__Class()
local RednetMessageEvent = ____exports.RednetMessageEvent
RednetMessageEvent.name = "RednetMessageEvent"
function RednetMessageEvent.prototype.____constructor(self)
    self.sender = 0
    self.protocol = nil
end
function RednetMessageEvent.prototype.get_name(self)
    return "rednet_message"
end
function RednetMessageEvent.prototype.get_args(self)
    return {self.sender, self.message, self.protocol}
end
function RednetMessageEvent.init(self, args)
    if not (type(args[1]) == "string") or args[1] ~= "rednet_message" then
        return nil
    end
    local ev = __TS__New(____exports.RednetMessageEvent)
    ev.sender = args[2]
    ev.message = args[3]
    ev.protocol = args[4]
    return ev
end
____exports.ModemMessageEvent = __TS__Class()
local ModemMessageEvent = ____exports.ModemMessageEvent
ModemMessageEvent.name = "ModemMessageEvent"
function ModemMessageEvent.prototype.____constructor(self)
    self.side = ""
    self.channel = 0
    self.replyChannel = 0
    self.distance = 0
end
function ModemMessageEvent.prototype.get_name(self)
    return "modem_message"
end
function ModemMessageEvent.prototype.get_args(self)
    return {
        self.side,
        self.channel,
        self.replyChannel,
        self.message,
        self.distance
    }
end
function ModemMessageEvent.init(self, args)
    if not (type(args[1]) == "string") or args[1] ~= "modem_message" then
        return nil
    end
    local ev = __TS__New(____exports.ModemMessageEvent)
    ev.side = args[2]
    ev.channel = args[3]
    ev.replyChannel = args[4]
    ev.message = args[5]
    ev.distance = args[6]
    return ev
end
____exports.HTTPEvent = __TS__Class()
local HTTPEvent = ____exports.HTTPEvent
HTTPEvent.name = "HTTPEvent"
function HTTPEvent.prototype.____constructor(self)
    self.url = ""
    self.handle = nil
    self.error = nil
end
function HTTPEvent.prototype.get_name(self)
    return self.error == nil and "http_success" or "http_failure"
end
function HTTPEvent.prototype.get_args(self)
    local ____self_url_6 = self.url
    local ____temp_4
    if self.error == nil then
        ____temp_4 = self.handle
    else
        ____temp_4 = self.error
    end
    local ____temp_5
    if self.error ~= nil then
        ____temp_5 = self.handle
    else
        ____temp_5 = nil
    end
    return {____self_url_6, ____temp_4, ____temp_5}
end
function HTTPEvent.init(self, args)
    if not (type(args[1]) == "string") or args[1] ~= "http_success" and args[1] ~= "http_failure" then
        return nil
    end
    local ev = __TS__New(____exports.HTTPEvent)
    ev.url = args[2]
    if args[1] == "http_success" then
        ev.error = nil
        ev.handle = args[3]
    else
        ev.error = args[3]
        if ev.error == nil then
            ev.error = ""
        end
        ev.handle = args[4]
    end
    return ev
end
____exports.WebSocketEvent = __TS__Class()
local WebSocketEvent = ____exports.WebSocketEvent
WebSocketEvent.name = "WebSocketEvent"
function WebSocketEvent.prototype.____constructor(self)
    self.handle = nil
    self.error = nil
end
function WebSocketEvent.prototype.get_name(self)
    return self.error == nil and "websocket_success" or "websocket_failure"
end
function WebSocketEvent.prototype.get_args(self)
    local ____temp_7
    if self.handle == nil then
        ____temp_7 = self.error
    else
        ____temp_7 = self.handle
    end
    return {____temp_7}
end
function WebSocketEvent.init(self, args)
    if not (type(args[1]) == "string") or args[1] ~= "websocket_success" and args[1] ~= "websocket_failure" then
        return nil
    end
    local ev = __TS__New(____exports.WebSocketEvent)
    if args[1] == "websocket_success" then
        ev.handle = args[2]
        ev.error = nil
    else
        ev.error = args[2]
        ev.handle = nil
    end
    return ev
end
____exports.MouseEventType = MouseEventType or ({})
____exports.MouseEventType.Click = 0
____exports.MouseEventType[____exports.MouseEventType.Click] = "Click"
____exports.MouseEventType.Up = 1
____exports.MouseEventType[____exports.MouseEventType.Up] = "Up"
____exports.MouseEventType.Scroll = 2
____exports.MouseEventType[____exports.MouseEventType.Scroll] = "Scroll"
____exports.MouseEventType.Drag = 3
____exports.MouseEventType[____exports.MouseEventType.Drag] = "Drag"
____exports.MouseEventType.Touch = 4
____exports.MouseEventType[____exports.MouseEventType.Touch] = "Touch"
____exports.MouseEventType.Move = 5
____exports.MouseEventType[____exports.MouseEventType.Move] = "Move"
____exports.MouseEvent = __TS__Class()
local MouseEvent = ____exports.MouseEvent
MouseEvent.name = "MouseEvent"
function MouseEvent.prototype.____constructor(self)
    self.button = 0
    self.x = 0
    self.y = 0
    self.side = nil
    self.type = ____exports.MouseEventType.Click
end
function MouseEvent.prototype.get_name(self)
    return ({
        [____exports.MouseEventType.Click] = "mouse_click",
        [____exports.MouseEventType.Up] = "mouse_up",
        [____exports.MouseEventType.Scroll] = "mouse_scroll",
        [____exports.MouseEventType.Drag] = "mouse_drag",
        [____exports.MouseEventType.Touch] = "monitor_touch",
        [____exports.MouseEventType.Move] = "mouse_move"
    })[self.type]
end
function MouseEvent.prototype.get_args(self)
    local ____temp_8
    if self.type == ____exports.MouseEventType.Touch then
        ____temp_8 = self.side
    else
        ____temp_8 = self.button
    end
    return {____temp_8, self.x, self.y}
end
function MouseEvent.init(self, args)
    if not (type(args[1]) == "string") then
        return nil
    end
    local ev = __TS__New(____exports.MouseEvent)
    local ____type = args[1]
    if ____type == "mouse_click" then
        ev.type = ____exports.MouseEventType.Click
        ev.button = args[2]
        ev.side = nil
    elseif ____type == "mouse_up" then
        ev.type = ____exports.MouseEventType.Up
        ev.button = args[2]
        ev.side = nil
    elseif ____type == "mouse_scroll" then
        ev.type = ____exports.MouseEventType.Scroll
        ev.button = args[2]
        ev.side = nil
    elseif ____type == "mouse_drag" then
        ev.type = ____exports.MouseEventType.Drag
        ev.button = args[2]
        ev.side = nil
    elseif ____type == "monitor_touch" then
        ev.type = ____exports.MouseEventType.Touch
        ev.button = 0
        ev.side = args[2]
    elseif ____type == "mouse_move" then
        ev.type = ____exports.MouseEventType.Move
        ev.button = args[2]
        ev.side = nil
    else
        return nil
    end
    ev.x = args[3]
    ev.y = args[4]
    return ev
end
____exports.ResizeEvent = __TS__Class()
local ResizeEvent = ____exports.ResizeEvent
ResizeEvent.name = "ResizeEvent"
function ResizeEvent.prototype.____constructor(self)
    self.side = nil
end
function ResizeEvent.prototype.get_name(self)
    return self.side == nil and "term_resize" or "monitor_resize"
end
function ResizeEvent.prototype.get_args(self)
    return {self.side}
end
function ResizeEvent.init(self, args)
    if not (type(args[1]) == "string") or args[1] ~= "term_resize" and args[1] ~= "monitor_resize" then
        return nil
    end
    local ev = __TS__New(____exports.ResizeEvent)
    if args[1] == "monitor_resize" then
        ev.side = args[2]
    else
        ev.side = nil
    end
    return ev
end
____exports.TurtleInventoryEvent = __TS__Class()
local TurtleInventoryEvent = ____exports.TurtleInventoryEvent
TurtleInventoryEvent.name = "TurtleInventoryEvent"
function TurtleInventoryEvent.prototype.____constructor(self)
end
function TurtleInventoryEvent.prototype.get_name(self)
    return "turtle_inventory"
end
function TurtleInventoryEvent.prototype.get_args(self)
    return {}
end
function TurtleInventoryEvent.init(self, args)
    if not (type(args[1]) == "string") or args[1] ~= "turtle_inventory" then
        return nil
    end
    local ev = __TS__New(____exports.TurtleInventoryEvent)
    return ev
end
local SpeakerAudioEmptyEvent = __TS__Class()
SpeakerAudioEmptyEvent.name = "SpeakerAudioEmptyEvent"
function SpeakerAudioEmptyEvent.prototype.____constructor(self)
    self.side = ""
end
function SpeakerAudioEmptyEvent.prototype.get_name(self)
    return "speaker_audio_empty"
end
function SpeakerAudioEmptyEvent.prototype.get_args(self)
    return {self.side}
end
function SpeakerAudioEmptyEvent.init(self, args)
    if not (type(args[1]) == "string") or args[1] ~= "speaker_audio_empty" then
        return nil
    end
    local ev
    ev.side = args[2]
    return ev
end
local ComputerCommandEvent = __TS__Class()
ComputerCommandEvent.name = "ComputerCommandEvent"
function ComputerCommandEvent.prototype.____constructor(self)
    self.args = {}
end
function ComputerCommandEvent.prototype.get_name(self)
    return "computer_command"
end
function ComputerCommandEvent.prototype.get_args(self)
    return self.args
end
function ComputerCommandEvent.init(self, args)
    if not (type(args[1]) == "string") or args[1] ~= "computer_command" then
        return nil
    end
    local ev
    ev.args = __TS__ArraySlice(args, 1)
    return ev
end
____exports.GenericEvent = __TS__Class()
local GenericEvent = ____exports.GenericEvent
GenericEvent.name = "GenericEvent"
function GenericEvent.prototype.____constructor(self)
    self.args = {}
end
function GenericEvent.prototype.get_name(self)
    return self.args[1]
end
function GenericEvent.prototype.get_args(self)
    return __TS__ArraySlice(self.args, 1)
end
function GenericEvent.init(self, args)
    local ev = __TS__New(____exports.GenericEvent)
    ev.args = args
    return ev
end
local eventInitializers = {
    ____exports.CharEvent.init,
    ____exports.KeyEvent.init,
    ____exports.PasteEvent.init,
    ____exports.TimerEvent.init,
    ____exports.TaskCompleteEvent.init,
    ____exports.RedstoneEvent.init,
    ____exports.TerminateEvent.init,
    ____exports.DiskEvent.init,
    ____exports.PeripheralEvent.init,
    ____exports.RednetMessageEvent.init,
    ____exports.ModemMessageEvent.init,
    ____exports.HTTPEvent.init,
    ____exports.WebSocketEvent.init,
    ____exports.MouseEvent.init,
    ____exports.ResizeEvent.init,
    ____exports.TurtleInventoryEvent.init,
    SpeakerAudioEmptyEvent.init,
    ComputerCommandEvent.init,
    ____exports.GenericEvent.init
}
function ____exports.pullEventRaw(self, filter)
    local args = table.pack({coroutine.yield(filter)})
    for ____, init in ipairs(eventInitializers) do
        local ev = init(nil, args)
        if ev ~= nil then
            return ev
        end
    end
    return ____exports.GenericEvent:init(args)
end
function ____exports.pullEvent(self, filter)
    local ev = ____exports.pullEventRaw(nil, filter)
    if __TS__InstanceOf(ev, ____exports.TerminateEvent) then
        error("Terminated", 0)
    end
    return ev
end
function ____exports.pullEventRawAs(self, ____type, filter)
    local ev = ____exports.pullEventRaw(nil, filter)
    if __TS__InstanceOf(ev, ____type) then
        return ev
    else
        return nil
    end
end
function ____exports.pullEventAs(self, ____type, filter)
    local ev = ____exports.pullEvent(nil, filter)
    if __TS__InstanceOf(ev, ____type) then
        return ev
    else
        return nil
    end
end
return ____exports
 end,
["main"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
print("Hello World!")
return ____exports
 end,
}
return require("main", ...)
