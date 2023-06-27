/*
NaniteUI

Description: This code represents the user interface (UI) functionality for the nanite system. The NaniteUI provides visual elements and updates for the nanite energy bar and additional information.

Usage: Call 'NaniteUI' to initialize and display the nanite UI for the player. Call 'NaniteUIUpdate' to update the UI based on the player's nanite energy. Call 'NaniteUIStop' to stop the UI and remove the event handler.

Global Variables:
- naniteActivationState (Boolean): Represents the activation state of the nanite system for the player. Set to 'true' when the system is active.
- naniteGUIHidePercantage (Boolean): Represents whether to hide the nanite energy percentage in the UI.
- naniteEnergy (Number): Represents the current value of the player's nanite energy.
- eta_nanite_energy_bar (Display): Reference to the nanite energy bar display.
- eta_nanite_hud_menu_idd (Control): Reference to the additional information control in the nanite UI.

*/


NaniteUI = {
	if (!player getVariable["naniteActivationState",false]) exitWith {};

	player spawn{
		//INITIALIZATION
		disableSerialization;
		("layer_eta_nanite_hud_menu" call BIS_fnc_rscLayer) cutRsc ["eta_nanite_hud_additional_information", "plain", -1, false];
		("layer_eta_nanite_energy_bar_empty" call BIS_fnc_rscLayer) cutRsc ["eta_rsc_nanite_hud_fuel_bar_empty", "plain",-1,false];
		("layer_eta_nanite_energy_bar" call BIS_fnc_rscLayer) cutRsc ["eta_nanite_energy_bar", "plain", -1, false];
		("layer_eta_nanite_HUD" call BIS_fnc_rscLayer) cutRsc ["eta_rsc_nanite_hud_menu_background", "plain", -1, false];
		("layer_eta_nanite_active" call BIS_fnc_rscLayer) cutText ["", "plain"];

		private _display = uiNamespace getVariable "eta_nanite_energy_bar";
		private _set_bar = _display displayCtrl 629211;
		private _isNaniteGUIHidePercantage = player getVariable["naniteGUIHidePercantage",false];

		//UPDATE POWER BAR
		private _nanitePlayerEHonEachFrameUI = player addEventHandler ["EachFrame", {
			player call NaniteUIUpdate;
		}];
		player setVariable["_nanitePlayerEHonEachFrameUI",_nanitePlayerEHonEachFrameUI];
	};
};

NaniteUIUpdate = {
	if (!player getVariable["naniteActivationState",false]) exitWith {};

	private _display = uiNamespace getVariable "eta_nanite_energy_bar";
	private _set_bar = _display displayCtrl 629211;
	private _isNaniteGUIHidePercantage = player getVariable["naniteGUIHidePercantage",false];
	private _naniteEnergy = player getVariable["naniteEnergy"];

	_set_bar progressSetPosition (_naniteEnergy/100);

	_display_percentage = uiNamespace getVariable "eta_nanite_hud_menu_idd";
	_control = _display_percentage displayCtrl 629217;
	_updated_text = format["<t valign='middle' align='left' size='0.75' fonts='Zeppelin33' color='#3bb7f3'>Suit Status:  <t align='right'>%1%2</t><br/><br/>Distance to Target: <t align='right'>%3</t><br/><br/>Airburst: <t align='right'>%4</t><br/><br/>Gun Handling: <t align='right'>%5</t><br/><br/></t>",_suit_status,"",DisMes,DisLockedUI,_weapon_handling];
	_control ctrlSetStructuredText parseText _updated_text;
	sleep 0.5;

	if (!_isNaniteGUIHidePercantage) then {
		("layer_eta_nanite_display_percentage" call BIS_fnc_rscLayer) cutRsc ["eta_nanite_hud_energy_percentage", "plain", -1, false];
		private _percentage = _naniteEnergy;
		_percentage = format ["<t valign='middle' align='center' size='2' fonts='Zeppelin33' color='#3bb7f3'>%1%2</t>", _percentage,"%"];
		_control ctrlSetStructuredText parseText _percentage;
	};
};

NaniteUIStop = {
	private _naniteUIEventHandler = player getVariable["_nanitePlayerEHonEachFrameUI"];
	player removeEventHandler["onEachFrame",_naniteUIEventHandler];
}