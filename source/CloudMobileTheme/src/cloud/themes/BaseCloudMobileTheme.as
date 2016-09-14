package cloud.themes
{
	import flash.geom.Rectangle;
	import flash.text.TextFormat;
	import flash.text.engine.CFFHinting;
	import flash.text.engine.ElementFormat;
	import flash.text.engine.FontDescription;
	import flash.text.engine.FontLookup;
	import flash.text.engine.FontPosture;
	import flash.text.engine.FontWeight;
	import flash.text.engine.RenderingMode;
	
	import feathers.controls.Alert;
	import feathers.controls.Button;
	import feathers.controls.ButtonGroup;
	import feathers.controls.ButtonState;
	import feathers.controls.Callout;
	import feathers.controls.Check;
	import feathers.controls.DateTimeSpinner;
	import feathers.controls.Drawers;
	import feathers.controls.GroupedList;
	import feathers.controls.Header;
	import feathers.controls.ImageLoader;
	import feathers.controls.ItemRendererLayoutOrder;
	import feathers.controls.Label;
	import feathers.controls.LayoutGroup;
	import feathers.controls.List;
	import feathers.controls.NumericStepper;
	import feathers.controls.PageIndicator;
	import feathers.controls.Panel;
	import feathers.controls.PanelScreen;
	import feathers.controls.PickerList;
	import feathers.controls.ProgressBar;
	import feathers.controls.Radio;
	import feathers.controls.ScrollContainer;
	import feathers.controls.ScrollScreen;
	import feathers.controls.ScrollText;
	import feathers.controls.Scroller;
	import feathers.controls.SimpleScrollBar;
	import feathers.controls.Slider;
	import feathers.controls.SpinnerList;
	import feathers.controls.StepperButtonLayoutMode;
	import feathers.controls.TabBar;
	import feathers.controls.TextArea;
	import feathers.controls.TextCallout;
	import feathers.controls.TextInput;
	import feathers.controls.TextInputState;
	import feathers.controls.ToggleButton;
	import feathers.controls.ToggleSwitch;
	import feathers.controls.TrackLayoutMode;
	import feathers.controls.popups.BottomDrawerPopUpContentManager;
	import feathers.controls.popups.CalloutPopUpContentManager;
	import feathers.controls.renderers.BaseDefaultItemRenderer;
	import feathers.controls.renderers.DefaultGroupedListHeaderOrFooterRenderer;
	import feathers.controls.renderers.DefaultGroupedListItemRenderer;
	import feathers.controls.renderers.DefaultListItemRenderer;
	import feathers.controls.text.ITextEditorViewPort;
	import feathers.controls.text.StageTextTextEditor;
	import feathers.controls.text.TextBlockTextEditor;
	import feathers.controls.text.TextBlockTextRenderer;
	import feathers.controls.text.TextFieldTextEditorViewPort;
	import feathers.core.FeathersControl;
	import feathers.core.ITextEditor;
	import feathers.core.ITextRenderer;
	import feathers.core.PopUpManager;
	import feathers.layout.Direction;
	import feathers.layout.HorizontalAlign;
	import feathers.layout.HorizontalLayout;
	import feathers.layout.RelativePosition;
	import feathers.layout.VerticalAlign;
	import feathers.layout.VerticalLayout;
	import feathers.skins.ImageSkin;
	import feathers.system.DeviceCapabilities;
	import feathers.themes.StyleNameFunctionTheme;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	public class BaseCloudMobileTheme extends StyleNameFunctionTheme 
	{
		[Embed(source="../../assets/fonts/rubik-regular.ttf", fontFamily="Rubik Regular", fontName="Rubik Regular", fontWeight="normal", mimeType="application/x-font", embedAsCFF="true")]
		private static const MUSEO_SANS_ROUNDED_500:Class;
		
		[Embed(source="../../assets/fonts/rubik-regular.ttf", fontFamily="Rubik Regular", fontName="Rubik Regular", fontWeight="normal", mimeType="application/x-font", embedAsCFF="false")]
		private static const MUSEO_SANS_ROUNDED_500_CFF:Class;
		
		public static const FONT_NAME:String = "Rubik Regular";
		
		protected static const DARK_TEXT_COLOR:uint = 0x294668;
		protected static const LIGHT_TEXT_COLOR:uint = 0xF7F7F7;
		
		protected static const DEFAULT_BACKGROUND_COLOR:uint = 0xE1E6E9;
		
		protected static const LIST_BACKGROUND_COLOR:uint = 0xB7C4CC;
		
		protected static const GROUPED_LIST_HEADER_BACKGROUND_COLOR:uint = 0xB7C4CC;
		protected static const GROUPED_LIST_FOOTER_BACKGROUND_COLOR:uint = 0xB7C4CC;
		
		protected static const MODAL_OVERLAY_ALPHA:Number = 0.8;
		protected static const MODAL_OVERLAY_COLOR:uint = 0x29241E;		
		
		protected static const DRAWER_OVERLAY_ALPHA:Number = 0.4;
		protected static const DRAWER_OVERLAY_COLOR:uint = 0x29241E;		
		
		protected static const ALERT_BACKGROUND_SCALE9_GRID:Rectangle = new Rectangle(20, 20, 2, 2);
		
		protected static const BUTTON_SCALE9_GRID:Rectangle = new Rectangle(20, 20, 2, 2);
		protected static const TOGGLE_BUTTON_SCALE9_GRID:Rectangle = new Rectangle(20, 20, 2, 2);
		protected static const PRIMARY_BUTTON_SCALE9_GRID:Rectangle = new Rectangle(20, 20, 2, 2);
		protected static const BACK_BUTTON_SCALE9_GRID:Rectangle = new Rectangle(20, 20, 2, 2);
		protected static const QUIET_BUTTON_SCALE9_GRID:Rectangle = new Rectangle(20, 20, 2, 2);		
		protected static const DANGER_BUTTON_SCALE9_GRID:Rectangle = new Rectangle(20, 20, 2, 2);	
		protected static const FORWARD_BUTTON_SCALE9_GRID:Rectangle = new Rectangle(20, 20, 2, 2);		
		protected static const CALL_TO_ACTION_BUTTON_SCALE9_GRID:Rectangle = new Rectangle(20, 20, 2, 2);		
		
		protected static const CALLOUT_BACKGROUND_SCALE9_GRID:Rectangle = new Rectangle(20, 20, 2, 2);		
		protected static const DANGER_CALLOUT_BACKGROUND_SCALE9_GRID:Rectangle = new Rectangle(20, 20, 2, 2);					
		
		protected static const INSET_ITEM_RENDERER_MIDDLE_SCALE9_GRID:Rectangle = new Rectangle(2, 2, 1, 1);		
		protected static const INSET_ITEM_RENDERER_FIRST_SCALE9_GRID:Rectangle = new Rectangle(6, 6, 2, 2);		
		protected static const INSET_ITEM_RENDERER_LAST_SCALE9_GRID:Rectangle = new Rectangle(6, 6, 2, 2);		
		protected static const INSET_ITEM_RENDERER_SINGLE_SCALE9_GRID:Rectangle = new Rectangle(6, 6, 2, 2);
		
		protected static const HEADER_BACKGROUND_SCALE9_GRID:Rectangle = new Rectangle(20, 20, 2, 2);			
		
		protected static const ITEM_RENDERER_SCALE9_GRID:Rectangle = new Rectangle(2, 2, 1, 1);	
		
		protected static const PANEL_BACKGROUND_SCALE9_GRID:Rectangle = new Rectangle(20, 20, 2, 2);
		
		protected static const PICKER_LIST_BACKGROUND_SCALE9_GRID:Rectangle = new Rectangle(20, 20, 2, 2);	
		
		protected static const VERTICAL_PROGRESS_BAR_SCALE9_GRID:Rectangle = new Rectangle(2, 9, 2, 2);
		protected static const HORIZONTAL_PROGRESS_BAR_SCALE9_GRID:Rectangle = new Rectangle(9, 2, 2, 2);
		
		protected static const VERTICAL_SCROLL_BAR_THUMB_SCALE9_GRID:Rectangle = new Rectangle(2, 9, 2, 2);
		protected static const HORIZONTAL_SCROLL_BAR_THUMB_SCALE9_GRID:Rectangle = new Rectangle(9, 2, 2, 2);
		
		protected static const SLIDER_BUTTON_SCALE9_GRID:Rectangle = new Rectangle(20, 20, 2, 2);
		
		protected static const HORIZONTAL_MINIMUM_TRACK_SCALE9_GRID:Rectangle = new Rectangle(2, 2, 2, 2);		
		protected static const HORIZONTAL_MAXIMUM_TRACK_SCALE9_GRID:Rectangle = new Rectangle(2, 2, 2, 2);
		
		protected static const VERTICAL_MINIMUM_TRACK_SCALE9_GRID:Rectangle = new Rectangle(2, 2, 2, 2);		
		protected static const VERTICAL_MAXIMUM_TRACK_SCALE9_GRID:Rectangle = new Rectangle(2, 2, 2, 2);
		
		protected static const SPINNER_LIST_BACKGROUND_SCALE9_GRID:Rectangle = new Rectangle(20, 20, 2, 2);			
		protected static const SPINNER_LIST_SELECTION_OVERLAY_SCALE9_GRID:Rectangle = new Rectangle(2, 21, 2, 2);		
		
		protected static const TAB_SCALE9_GRID:Rectangle = new Rectangle(20, 20, 2, 2);
		
		protected static const TEXT_INPUT_SCALE9_GRID:Rectangle = new Rectangle(20, 20, 2, 2);		
		protected static const SEARCH_TEXT_INPUT_SCALE9_GRID:Rectangle = new Rectangle(20, 20, 2, 2);	
		protected static const TEXT_AREA_SCALE9_GRID:Rectangle = new Rectangle(20, 20, 2, 2);		
		
		protected static const TOGGLE_SWITCH_THUMB_SCALE9_GRID:Rectangle = new Rectangle(15, 15, 2, 2);
		
		protected static const TOGGLE_SWITCH_TRACK_SCALE9_GRID:Rectangle = new Rectangle(15, 15, 2, 2);
		
		protected static const THEME_STYLE_NAME_ALERT_BUTTON_GROUP_BUTTON:String = "cloud_mobile_alert_button_group_button";
		
		protected static const THEME_STYLE_NAME_PRIMARY_BUTTON:String = "cloud_mobile_primary_button";
		
		protected static const THEME_STYLE_NAME_QUIET_BUTTON_LABEL:String = "cloud_mobile_quiet_button_label";
		protected static const THEME_STYLE_NAME_PRIMARY_BUTTON_LABEL:String = "cloud_mobile_primary_button_label";
		protected static const THEME_STYLE_NAME_CALL_TO_ACTION_BUTTON_LABEL:String = "cloud_mobile_call_to_action_button_label";
		protected static const THEME_STYLE_NAME_DANGER_BUTTON_LABEL:String = "cloud_mobile_danger_button_label";
		protected static const THEME_STYLE_NAME_BACK_BUTTON_LABEL:String = "cloud_mobile_back_button_label";
		protected static const THEME_STYLE_NAME_FORWARD_BUTTON_LABEL:String = "cloud_mobile_forward_button_label";			
		protected static const THEME_STYLE_NAME_BUTTON_GROUP_BUTTON_LABEL:String = "cloud_mobile_button_group_button_label";
		
		protected static const THEME_STYLE_NAME_GROUPED_LIST_FOOTER_CONTENT_LABEL:String = "cloud_mobile_grouped_list_footer_content_label";
		
		protected static const THEME_STYLE_NAME_CHECK_ITEM_RENDERER_LABEL:String = "cloud_mobile_check_item_renderer_label";
		protected static const THEME_STYLE_NAME_CHECK_ITEM_RENDERER_ICON_LABEL:String = "cloud_mobile_check_item_renderer_icon_label";
		protected static const THEME_STYLE_NAME_CHECK_ITEM_RENDERER_ACCESSORY_LABEL:String = "cloud_mobile_check_item_renderer_accessory_label";
		
		protected static const THEME_STYLE_NAME_SPINNER_LIST_ITEM_RENDERER:String = "cloud_mobile_spinner_list_item_renderer";
		protected static const THEME_STYLE_NAME_SPINNER_LIST_ITEM_RENDERER_LABEL:String = "cloud_mobile_spinner_list_item_renderer_label";
		protected static const THEME_STYLE_NAME_SPINNER_LIST_ITEM_RENDERER_ICON_LABEL:String = "cloud_mobile_spinner_list_item_renderer_icon_label";		
		protected static const THEME_STYLE_NAME_SPINNER_LIST_ITEM_RENDERER_ACCESSORY_LABEL:String = "cloud_mobile_spinner_list_item_renderer_accessory_label";
		
		protected static const THEME_STYLE_NAME_TAB_LABEL:String = "cloud_mobile_tab_label";
		
		protected static const THEME_STYLE_NAME_HORIZONTAL_SIMPLE_SCROLL_BAR_THUMB:String = "cloud_mobile_horizontal_simple_scroll_bar_thumb";		
		protected static const THEME_STYLE_NAME_VERTICAL_SIMPLE_SCROLL_BAR_THUMB:String = "cloud_mobile_vertical_simple_scroll_bar_thumb";
		
		protected static const THEME_STYLE_NAME_HORIZONTAL_SLIDER_MINIMUM_TRACK:String = "cloud_mobile_horizontal_slider_minimum_track";	
		protected static const THEME_STYLE_NAME_HORIZONTAL_SLIDER_MAXIMUM_TRACK:String = "cloud_mobile_horizontal_slider_maximum_track";
		
		protected static const THEME_STYLE_NAME_VERTICAL_SLIDER_MINIMUM_TRACK:String = "cloud_mobile_vertical_slider_minimum_track";
		protected static const THEME_STYLE_NAME_VERTICAL_SLIDER_MAXIMUM_TRACK:String = "cloud_mobile_vertical_slider_maximum_track";
		
		protected static const THEME_STYLE_NAME_NUMERIC_STEPPER_TEXT_INPUT_EDITOR:String = "cloud_mobile_numeric_stepper_text_input_editor";
		
		protected static const THEME_STYLE_NAME_DATE_TIME_SPINNER_LIST_ITEM_RENDERER:String = "cloud_mobile_date_time_spinner_list_item_renderer";	
		
		protected static const THEME_STYLE_NAME_HEADING_LABEL_TEXT_RENDERER:String = "cloud_mobile_heading_label_text_renderer";
		
		protected static const THEME_STYLE_NAME_DETAIL_LABEL_TEXT_RENDERER:String = "cloud_mobile_detail_label_text_renderer";
		
		protected static function textRendererFactory():ITextRenderer
		{
			return new TextBlockTextRenderer();
		}
		
		protected static function textEditorFactory():ITextEditor
		{
			return new StageTextTextEditor();
		}
		
		protected static function textAreaTextEditorFactory():ITextEditorViewPort
		{
			return new TextFieldTextEditorViewPort();
		}
		
		protected static function stepperTextEditorFactory():TextBlockTextEditor
		{
			return new TextBlockTextEditor();
		}
		
		protected static function pickerListSpinnerListFactory():SpinnerList
		{
			return new SpinnerList();
		}
		
		protected static function scrollBarFactory():SimpleScrollBar
		{
			return new SimpleScrollBar();
		}
		
		protected static function popUpOverlayFactory():DisplayObject
		{
			var quad:Quad = new Quad(100, 100, MODAL_OVERLAY_COLOR);
			quad.alpha = MODAL_OVERLAY_ALPHA;
			return quad;
		}		
		
		protected var gridSize:int
		protected var gutterSize:int;
		protected var smallGutterSize:int;
		protected var smallControlGutterSize:int;
		protected var wideControlSize:int;
		protected var controlSize:int;
		protected var smallControlSize:int;
		protected var borderSize:int;		
		protected var thumbSize:int;
		protected var popUpFillSize:int;
		protected var calloutBackgroundMinSize:int;
		protected var calloutArrowOverlapGap:int;
		protected var scrollBarGutterSize:int;
		
		protected var smallFontSize:int;
		protected var regularFontSize:int;
		protected var largeFontSize:int;
		protected var extraLargeFontSize:int;
		
		protected var regularFontDescription:FontDescription;
		protected var boldFontDescription:FontDescription;
		
		protected var alertMessageElementFormat:ElementFormat;
		
		protected var buttonElementFormat:ElementFormat;
		protected var buttonDisabledElementFormat:ElementFormat;
		
		protected var primaryButtonElementFormat:ElementFormat;
		protected var primaryButtonDisabledElementFormat:ElementFormat;
		
		protected var toggleButtonElementFormat:ElementFormat;
		protected var toggleButtonDisabledElementFormat:ElementFormat;
		
		protected var callToActionButtonElementFormat:ElementFormat;
		protected var callToActionButtonDisabledElementFormat:ElementFormat;
		
		protected var quietButtonElementFormat:ElementFormat;
		protected var quietButtonDownElementFormat:ElementFormat;
		protected var quietButtonDisabledElementFormat:ElementFormat;
		
		protected var dangerButtonElementFormat:ElementFormat;
		protected var dangerButtonDisabledElementFormat:ElementFormat;
		
		protected var backButtonElementFormat:ElementFormat;
		protected var backButtonDownElementFormat:ElementFormat;
		protected var backButtonDisabledElementFormat:ElementFormat;
		
		protected var forwardButtonElementFormat:ElementFormat;
		protected var forwardButtonDownElementFormat:ElementFormat;
		protected var forwardButtonDisabledElementFormat:ElementFormat;
		
		protected var buttonGroupElementFormat:ElementFormat;
		protected var buttonGroupDisabledElementFormat:ElementFormat;
		
		protected var checkElementFormat:ElementFormat;
		protected var checkDisabledElementFormat:ElementFormat;
		
		protected var groupedListHeaderElementFormat:ElementFormat;
		protected var groupedListHeaderDisabledElementFormat:ElementFormat;
		
		protected var groupedListFooterElementFormat:ElementFormat;
		protected var groupedListFooterDisabledElementFormat:ElementFormat;
		
		protected var headerElementFormat:ElementFormat;
		protected var headerDisabledElementFormat:ElementFormat;
		
		protected var labelElementFormat:ElementFormat;
		protected var labelDisabledElementFormat:ElementFormat;
		
		protected var headingLabelElementFormat:ElementFormat;
		protected var headingLabelDisabledElementFormat:ElementFormat;
		
		protected var detailLabelElementFormat:ElementFormat;
		protected var detailLabelDisabledElementFormat:ElementFormat;
		
		protected var itemRendererLabelElementFormat:ElementFormat;
		protected var itemRendererLabelDownElementFormat:ElementFormat;
		protected var itemRendererLabelSelectedElementFormat:ElementFormat;
		protected var itemRendererLabelDisabledElementFormat:ElementFormat;
		
		protected var itemRendererAccessoryLabelElementFormat:ElementFormat;
		protected var itemRendererAccessoryLabelDownElementFormat:ElementFormat;
		protected var itemRendererAccessoryLabelSelectedElementFormat:ElementFormat;
		protected var itemRendererAccessoryLabelDisabledElementFormat:ElementFormat;
		
		protected var itemRendererIconLabelElementFormat:ElementFormat;
		protected var itemRendererIconLabelDownElementFormat:ElementFormat;
		protected var itemRendererIconLabelSelectedElementFormat:ElementFormat;
		protected var itemRendererIconLabelDisabledElementFormat:ElementFormat;
		
		protected var checkItemRendererLabelElementFormat:ElementFormat;
		protected var checkItemRendererLabelDownElementFormat:ElementFormat;
		protected var checkItemRendererLabelSelectedElementFormat:ElementFormat;
		protected var checkItemRendererLabelDisabledElementFormat:ElementFormat;		
		
		protected var checkItemRendererAccessoryLabelElementFormat:ElementFormat;
		protected var checkItemRendererAccessoryLabelDownElementFormat:ElementFormat;
		protected var checkItemRendererAccessoryLabelSelectedElementFormat:ElementFormat;
		protected var checkIemRendererAccessoryLabelDisabledElementFormat:ElementFormat;
		
		protected var checkItemRendererIconLabelElementFormat:ElementFormat;
		protected var checkItemRendererIconLabelDownElementFormat:ElementFormat;
		protected var checkItemRendererIconLabelSelectedElementFormat:ElementFormat;
		protected var checkItemRendererIconLabelDisabledElementFormat:ElementFormat;
		
		protected var numericStepperElementFormat:ElementFormat;
		protected var numericStepperDisabledElementFormat:ElementFormat;
		
		protected var radioElementFormat:ElementFormat;
		protected var radioDisabledElementFormat:ElementFormat;
		
		protected var scrollTextTextFormat:TextFormat;
		protected var scrollTextDisabledTextFormat:TextFormat;
		
		protected var spinnerListItemRendererLabelElementFormat:ElementFormat;
		protected var spinnerListItemRendererLabelDisabledElementFormat:ElementFormat;
		
		protected var spinnerListItemRendererIconLabelElementFormat:ElementFormat;
		protected var spinnerListItemRendererIconLabelDisabledElementFormat:ElementFormat;
		
		protected var spinnerListItemRendererAccessoryLabelElementFormat:ElementFormat;
		protected var spinnerListItemRendererAccessoryLabelDisabledElementFormat:ElementFormat;
		
		protected var tabLabelElementFormat:ElementFormat;
		protected var tabLabelDownElementFormat:ElementFormat;
		protected var tabLabelSelectedElementFormat:ElementFormat;
		protected var tabLabelDisabledElementFormat:ElementFormat;		
		
		protected var textInputPromptElementFormat:ElementFormat;
		protected var textInputPromptDisabledElementFormat:ElementFormat;
		
		protected var textCalloutTextElementFormat:ElementFormat;
		
		protected var textAreaTextFormat:TextFormat;
		protected var textAreaDisabledTextFormat:TextFormat;	
		
		public var atlas:TextureAtlas;
		
		protected var alertBackgroundSkinTexture:Texture;
		
		protected var buttonUpSkinTexture:Texture;
		protected var buttonDownSkinTexture:Texture;
		protected var buttonDisabledSkinTexture:Texture;
		
		protected var toggleButtonSelectedUpSkinTexture:Texture;
		protected var toggleButtonSelectedDisabledSkinTexture:Texture;
		
		protected var primaryButtonUpSkinTexture:Texture;
		protected var primaryButtonDownSkinTexture:Texture;
		protected var primaryButtonDisabledSkinTexture:Texture;
		
		protected var callToActionButtonUpSkinTexture:Texture;
		protected var callToActionButtonDownSkinTexture:Texture;
		protected var callToActionButtonDisabledSkinTexture:Texture;
		
		protected var quietButtonDownSkinTexture:Texture;
		protected var quietButtonDisabledSkinTexture:Texture;
		
		protected var dangerButtonUpSkinTexture:Texture;
		protected var dangerButtonDownSkinTexture:Texture;
		protected var dangerButtonDisabledSkinTexture:Texture;
		
		protected var buttonBackUpIconTexture:Texture;
		protected var buttonBackDownIconTexture:Texture;
		
		protected var backButtonUpSkinTexture:Texture;
		protected var backButtonDownSkinTexture:Texture;
		protected var backButtonDisabledSkinTexture:Texture;
		
		protected var buttonForwardUpIconTexture:Texture;
		protected var buttonForwardDownIconTexture:Texture;
		
		protected var forwardButtonUpSkinTexture:Texture;
		protected var forwardButtonDownSkinTexture:Texture;
		protected var forwardButtonDisabledSkinTexture:Texture;
		
		protected var calloutBackgroundSkinTexture:Texture;
		protected var calloutTopArrowSkinTexture:Texture;
		protected var calloutRightArrowSkinTexture:Texture;
		protected var calloutBottomArrowSkinTexture:Texture;
		protected var calloutLeftArrowSkinTexture:Texture;
		
		protected var dangerCalloutBackgroundSkinTexture:Texture;		
		protected var dangerCalloutTopArrowSkinTexture:Texture;
		protected var dangerCalloutRightArrowSkinTexture:Texture;
		protected var dangerCalloutBottomArrowSkinTexture:Texture;
		protected var dangerCalloutLeftArrowSkinTexture:Texture;
		
		protected var checkUpIconTexture:Texture;
		protected var checkSelectedUpIconTexture:Texture;
		protected var checkDownIconTexture:Texture;
		protected var checkDisabledIconTexture:Texture;
		protected var checkSelectedDownIconTexture:Texture;
		protected var checkSelectedDisabledIconTexture:Texture;
		
		protected var insetItemRendererUpSkinTexture:Texture;
		protected var insetItemRendererSelectedSkinTexture:Texture;
		protected var insetItemRendererFirstUpSkinTexture:Texture;
		protected var insetItemRendererFirstSelectedSkinTexture:Texture;
		protected var insetItemRendererLastUpSkinTexture:Texture;
		protected var insetItemRendererLastSelectedSkinTexture:Texture;
		protected var insetItemRendererSingleUpSkinTexture:Texture;
		protected var insetItemRendererSingleSelectedSkinTexture:Texture;
		
		protected var headerBackgroundSkinTexture:Texture;
		
		protected var itemRendererUpSkinTexture:Texture;
		protected var itemRendererDownSkinTexture:Texture;
		protected var itemRendererSelectedSkinTexture:Texture;
		
		protected var listDrillDownAccessoryTexture:Texture;
		protected var listDrillDownAccessorySelectedTexture:Texture;
		
		protected var pageIndicatorNormalSkinTexture:Texture;
		protected var pageIndicatorSelectedSkinTexture:Texture;
		
		protected var panelBackgroundSkinTexture:Texture;
		
		protected var pickerListBackgroundSkinTexture:Texture;
		protected var pickerListItemSelectedIconTexture:Texture;
		
		protected var pickerListButtonIconTexture:Texture;
		protected var pickerListButtonSelectedIconTexture:Texture;
		protected var pickerListButtonIconDisabledTexture:Texture;
		
		protected var horizontalProgressBarFillSkinTexture:Texture;
		protected var horizontalProgressBarFillDisabledSkinTexture:Texture;
		protected var horizontalProgressBarBackgroundSkinTexture:Texture;
		protected var horizontalProgressBarBackgroundDisabledSkinTexture:Texture;
		
		protected var verticalProgressBarFillSkinTexture:Texture;
		protected var verticalProgressBarFillDisabledSkinTexture:Texture;
		protected var verticalProgressBarBackgroundSkinTexture:Texture;
		protected var verticalProgressBarBackgroundDisabledSkinTexture:Texture;
		
		protected var radioUpIconTexture:Texture;
		protected var radioSelectedUpIconTexture:Texture;
		protected var radioDownIconTexture:Texture;
		protected var radioDisabledIconTexture:Texture;
		protected var radioSelectedDownIconTexture:Texture;
		protected var radioSelectedDisabledIconTexture:Texture;
		
		protected var verticalScrollBarThumbSkinTexture:Texture;
		protected var horizontalScrollBarThumbSkinTexture:Texture;
		
		protected var sliderButtonUpSkinTexture:Texture;
		protected var sliderButtonDownSkinTexture:Texture;
		protected var sliderButtonDisabledSkinTexture:Texture;
		
		protected var horizontalSliderMinimumTrackSkinTexture:Texture;
		protected var horizontalSliderMinimumTrackDisabledSkinTexture:Texture;
		protected var horizontalSliderMaximumTrackSkinTexture:Texture;
		protected var horizontalSliderMaximumTrackDisabledSkinTexture:Texture;
		
		protected var verticalSliderMinimumTrackSkinTexture:Texture;
		protected var verticalSliderMinimumTrackDisabledSkinTexture:Texture;
		protected var verticalSliderMaximumTrackSkinTexture:Texture;
		protected var verticalSliderMaximumTrackDisabledSkinTexture:Texture;
		
		protected var spinnerListBackgroundSkinTexture:Texture;
		protected var spinnerListSelectionOverlaySkinTexture:Texture;
		
		protected var tabUpSkinTexture:Texture;
		protected var tabDownSkinTexture:Texture;
		protected var tabDisabledSkinTexture:Texture;
		protected var tabSelectedUpSkinTexture:Texture;
		protected var tabSelectedDisabledSkinTexture:Texture;
		
		protected var textInputBackgroundEnableSkinTexture:Texture;
		protected var textInputBackgroundFocusedSkinTexture:Texture;
		protected var textInputBackgroundErrorSkinTexture:Texture;
		protected var textInputBackgroundDisabledSkinTexture:Texture;
		
		protected var searchIconTexture:Texture;
		protected var searchIconDisabledTexture:Texture;
		
		protected var searchTextInputBackgroundEnableSkinTexture:Texture;
		protected var searchTextInputBackgroundFocusedSkinTexture:Texture;
		protected var searchTextInputBackgroundDisabledSkinTexture:Texture;
		
		protected var textAreaBackgroundEnableSkinTexture:Texture;
		protected var textAreaBackgroundFocusedSkinTexture:Texture;
		protected var textAreaBackgroundErrorSkinTexture:Texture;
		protected var textAreaBackgroundDisabledSkinTexture:Texture;		
		
		protected var toggleSwitchOnTrackSkinTexture:Texture;
		protected var toggleSwitchOnTrackDisabledSkinTexture:Texture;
		protected var toggleSwitchOffTrackSkinTexture:Texture;
		protected var toggleSwitchOffTrackDisabledSkinTexture:Texture;
		
		protected var toggleSwitchOnThumbTexture:Texture;
		protected var toggleSwitchOffThumbTexture:Texture;
		protected var toggleSwitchDisabledThumbTexture:Texture;		
		
		public function BaseCloudMobileTheme()
		{
			super();
		}
		
		override public function dispose():void
		{
			if(atlas)
			{
				atlas.texture.root.onRestore = null;
				
				atlas.dispose();
				atlas = null;
			}
			
			super.dispose();
		}
		
		protected function initialize():void
		{
			initializeDimensions();
			initializeFonts();
			initializeTextures();
			initializeGlobals();
			initializeStage();
			initializeStyleProviders();
		}
		
		protected function initializeStage():void
		{
			Starling.current.stage.color = DEFAULT_BACKGROUND_COLOR;
			Starling.current.nativeStage.color = DEFAULT_BACKGROUND_COLOR;
		}
		
		protected function initializeGlobals():void
		{
			FeathersControl.defaultTextRendererFactory = textRendererFactory;
			FeathersControl.defaultTextEditorFactory = textEditorFactory;
			
			PopUpManager.overlayFactory = popUpOverlayFactory;
			Callout.stagePadding = smallGutterSize;
		}
		
		protected function initializeDimensions():void
		{
			gridSize = 44;
			smallControlGutterSize = 16;
			smallGutterSize = 18;
			gutterSize = 22;
			controlSize = 28;
			smallControlSize = 12;
			popUpFillSize = 276;
			thumbSize = 34;
			calloutBackgroundMinSize = 12;
			calloutArrowOverlapGap = -3;
			scrollBarGutterSize = 2;
			wideControlSize = gridSize * 3 + gutterSize * 2;
			borderSize = 1;
		}
		
		protected function initializeFonts():void
		{
			smallFontSize = 10;
			regularFontSize = 12;
			largeFontSize = 14;
			extraLargeFontSize = 18;			
			
			regularFontDescription = new FontDescription(FONT_NAME, FontWeight.NORMAL, FontPosture.NORMAL, FontLookup.EMBEDDED_CFF, RenderingMode.CFF, CFFHinting.NONE);
			boldFontDescription = new FontDescription(FONT_NAME, FontWeight.BOLD, FontPosture.NORMAL, FontLookup.EMBEDDED_CFF, RenderingMode.CFF, CFFHinting.NONE);			
			
			alertMessageElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);
			
			buttonElementFormat = new ElementFormat(regularFontDescription, regularFontSize, LIGHT_TEXT_COLOR);
			buttonDisabledElementFormat = new ElementFormat(regularFontDescription, regularFontSize, LIGHT_TEXT_COLOR);
			
			primaryButtonElementFormat = new ElementFormat(regularFontDescription, regularFontSize, LIGHT_TEXT_COLOR);
			primaryButtonDisabledElementFormat = new ElementFormat(regularFontDescription, regularFontSize, LIGHT_TEXT_COLOR);
			
			toggleButtonElementFormat = new ElementFormat(regularFontDescription, regularFontSize, LIGHT_TEXT_COLOR);
			toggleButtonDisabledElementFormat = new ElementFormat(regularFontDescription, regularFontSize, LIGHT_TEXT_COLOR);
			
			callToActionButtonElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);
			callToActionButtonDisabledElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);
			
			quietButtonElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);
			quietButtonDownElementFormat = new ElementFormat(regularFontDescription, regularFontSize, LIGHT_TEXT_COLOR);
			quietButtonDisabledElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);
			
			dangerButtonElementFormat = new ElementFormat(regularFontDescription, regularFontSize, LIGHT_TEXT_COLOR);
			dangerButtonDisabledElementFormat = new ElementFormat(regularFontDescription, regularFontSize, LIGHT_TEXT_COLOR);
			
			backButtonElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);
			backButtonDownElementFormat = new ElementFormat(regularFontDescription, regularFontSize, LIGHT_TEXT_COLOR);
			backButtonDisabledElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);
			
			forwardButtonElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);
			forwardButtonDownElementFormat = new ElementFormat(regularFontDescription, regularFontSize, LIGHT_TEXT_COLOR);
			forwardButtonDisabledElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);
			
			buttonGroupElementFormat = new ElementFormat(regularFontDescription, regularFontSize, LIGHT_TEXT_COLOR);
			buttonGroupDisabledElementFormat = new ElementFormat(regularFontDescription, regularFontSize, LIGHT_TEXT_COLOR);
			
			checkElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);
			checkDisabledElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);
			
			groupedListHeaderElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);
			groupedListHeaderDisabledElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);
			
			groupedListFooterElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);
			groupedListFooterDisabledElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);
			
			headerElementFormat = new ElementFormat(boldFontDescription, extraLargeFontSize, DARK_TEXT_COLOR);
			headerDisabledElementFormat = new ElementFormat(boldFontDescription, extraLargeFontSize, DARK_TEXT_COLOR);
			
			labelElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);
			labelDisabledElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);
			
			headingLabelElementFormat = new ElementFormat(regularFontDescription, extraLargeFontSize, DARK_TEXT_COLOR);
			headingLabelDisabledElementFormat = new ElementFormat(regularFontDescription, extraLargeFontSize, DARK_TEXT_COLOR);
			
			detailLabelElementFormat = new ElementFormat(regularFontDescription, smallFontSize, DARK_TEXT_COLOR);
			detailLabelDisabledElementFormat = new ElementFormat(regularFontDescription, smallFontSize, DARK_TEXT_COLOR);
			
			itemRendererLabelElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);
			itemRendererLabelDownElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);
			itemRendererLabelSelectedElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);			
			itemRendererLabelDisabledElementFormat = new ElementFormat(regularFontDescription, regularFontSize, LIGHT_TEXT_COLOR);
			
			itemRendererAccessoryLabelElementFormat = new ElementFormat(regularFontDescription, regularFontSize, LIGHT_TEXT_COLOR);
			itemRendererAccessoryLabelDownElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);
			itemRendererAccessoryLabelSelectedElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);
			itemRendererAccessoryLabelDisabledElementFormat = new ElementFormat(regularFontDescription, regularFontSize, LIGHT_TEXT_COLOR);
			
			itemRendererIconLabelElementFormat = new ElementFormat(regularFontDescription, regularFontSize, LIGHT_TEXT_COLOR);
			itemRendererIconLabelDownElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);
			itemRendererIconLabelSelectedElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);
			itemRendererIconLabelDisabledElementFormat = new ElementFormat(regularFontDescription, regularFontSize, LIGHT_TEXT_COLOR);
			
			checkItemRendererLabelElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);
			checkItemRendererLabelDownElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);
			checkItemRendererLabelSelectedElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);
			checkItemRendererLabelDisabledElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);
			
			checkItemRendererIconLabelElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);
			checkItemRendererIconLabelDownElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);
			checkItemRendererIconLabelSelectedElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);
			checkItemRendererIconLabelDisabledElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);
			
			checkItemRendererAccessoryLabelElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);
			checkItemRendererAccessoryLabelDownElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);
			checkItemRendererAccessoryLabelSelectedElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);
			checkIemRendererAccessoryLabelDisabledElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);
			
			numericStepperElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);
			numericStepperDisabledElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);
			
			radioElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);
			radioDisabledElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);
			
			scrollTextTextFormat = new TextFormat(FONT_NAME, largeFontSize, DARK_TEXT_COLOR);
			scrollTextDisabledTextFormat = new TextFormat(FONT_NAME, largeFontSize, DARK_TEXT_COLOR);
			
			spinnerListItemRendererLabelElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);
			spinnerListItemRendererLabelDisabledElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);
			
			spinnerListItemRendererIconLabelElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);
			spinnerListItemRendererIconLabelDisabledElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);
			
			spinnerListItemRendererAccessoryLabelElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);
			spinnerListItemRendererAccessoryLabelDisabledElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);
			
			tabLabelElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);
			tabLabelDownElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);
			tabLabelSelectedElementFormat = new ElementFormat(regularFontDescription, regularFontSize, LIGHT_TEXT_COLOR);
			tabLabelDisabledElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);
			
			textCalloutTextElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);
			
			textInputPromptElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);
			textInputPromptDisabledElementFormat = new ElementFormat(regularFontDescription, regularFontSize, DARK_TEXT_COLOR);
			
			textAreaTextFormat = new TextFormat(FONT_NAME, regularFontSize, DARK_TEXT_COLOR);
			textAreaDisabledTextFormat = new TextFormat(FONT_NAME, regularFontSize, DARK_TEXT_COLOR);
		}
		
		protected function initializeTextures():void
		{			
			alertBackgroundSkinTexture = atlas.getTexture("alert-background-skin");
			
			buttonUpSkinTexture = atlas.getTexture("button-up-skin");
			buttonDownSkinTexture = atlas.getTexture("button-down-skin");
			buttonDisabledSkinTexture = atlas.getTexture("button-disabled-skin");
			
			primaryButtonUpSkinTexture = atlas.getTexture("primary-button-up-skin");
			primaryButtonDownSkinTexture = atlas.getTexture("primary-button-down-skin");
			primaryButtonDisabledSkinTexture = atlas.getTexture("primary-button-disabled-skin");
			
			toggleButtonSelectedUpSkinTexture = atlas.getTexture("toggle-button-selected-up-skin");
			toggleButtonSelectedDisabledSkinTexture = atlas.getTexture("toggle-button-selected-disabled-skin");
			
			callToActionButtonUpSkinTexture = atlas.getTexture("call-to-action-button-up-skin");
			callToActionButtonDownSkinTexture = atlas.getTexture("call-to-action-button-down-skin");
			callToActionButtonDisabledSkinTexture = atlas.getTexture("call-to-action-button-disabled-skin");
			
			quietButtonDownSkinTexture = atlas.getTexture("quiet-button-down-skin");
			quietButtonDisabledSkinTexture = atlas.getTexture("quiet-button-disabled-skin");
			
			dangerButtonUpSkinTexture = atlas.getTexture("danger-button-up-skin");
			dangerButtonDownSkinTexture = atlas.getTexture("danger-button-down-skin");
			dangerButtonDisabledSkinTexture = atlas.getTexture("danger-button-disabled-skin");
			
			buttonBackUpIconTexture = atlas.getTexture("button-back-up-icon");
			buttonBackDownIconTexture = atlas.getTexture("button-back-down-icon");
			
			backButtonUpSkinTexture = atlas.getTexture("back-button-up-skin");
			backButtonDownSkinTexture = atlas.getTexture("back-button-down-skin");
			backButtonDisabledSkinTexture = atlas.getTexture("back-button-disabled-skin");
			
			buttonForwardUpIconTexture = atlas.getTexture("button-forward-up-icon");
			buttonForwardDownIconTexture = atlas.getTexture("button-forward-down-icon");
			
			forwardButtonUpSkinTexture = atlas.getTexture("forward-button-up-skin");
			forwardButtonDownSkinTexture = atlas.getTexture("forward-button-down-skin");
			forwardButtonDisabledSkinTexture = atlas.getTexture("forward-button-disabled-skin");
			
			calloutBackgroundSkinTexture = atlas.getTexture("callout-background-skin");
			calloutTopArrowSkinTexture = atlas.getTexture("callout-top-arrow-skin");
			calloutRightArrowSkinTexture = atlas.getTexture("callout-right-arrow-skin");
			calloutBottomArrowSkinTexture = atlas.getTexture("callout-bottom-arrow-skin");
			calloutLeftArrowSkinTexture = atlas.getTexture("callout-left-arrow-skin");			
			
			dangerCalloutBackgroundSkinTexture = atlas.getTexture("danger-callout-background-skin");
			dangerCalloutTopArrowSkinTexture = atlas.getTexture("danger-callout-top-arrow-skin");
			dangerCalloutRightArrowSkinTexture = atlas.getTexture("danger-callout-right-arrow-skin");
			dangerCalloutBottomArrowSkinTexture = atlas.getTexture("danger-callout-bottom-arrow-skin");
			dangerCalloutLeftArrowSkinTexture = atlas.getTexture("danger-callout-left-arrow-skin");
			
			checkUpIconTexture = atlas.getTexture("check-up-icon");
			checkSelectedUpIconTexture = atlas.getTexture("check-selected-up-icon");
			checkDownIconTexture = atlas.getTexture("check-down-icon");
			checkDisabledIconTexture = atlas.getTexture("check-disabled-icon");
			checkSelectedDownIconTexture = atlas.getTexture("check-selected-down-icon");
			checkSelectedDisabledIconTexture = atlas.getTexture("check-selected-disabled-icon");
			
			insetItemRendererUpSkinTexture = atlas.getTexture("inset-item-renderer-up-skin");
			insetItemRendererSelectedSkinTexture = atlas.getTexture("inset-item-renderer-selected-skin");
			insetItemRendererFirstUpSkinTexture = atlas.getTexture("inset-item-renderer-first-up-skin");
			insetItemRendererFirstSelectedSkinTexture = atlas.getTexture("inset-item-renderer-first-selected-skin");
			insetItemRendererLastUpSkinTexture = atlas.getTexture("inset-item-renderer-last-up-skin");
			insetItemRendererLastSelectedSkinTexture = atlas.getTexture("inset-item-renderer-last-selected-skin");
			insetItemRendererSingleUpSkinTexture = atlas.getTexture("inset-item-renderer-single-up-skin");
			insetItemRendererSingleSelectedSkinTexture = atlas.getTexture("inset-item-renderer-single-selected-skin");
			
			headerBackgroundSkinTexture = atlas.getTexture("header-background-skin");
			
			itemRendererUpSkinTexture = atlas.getTexture("item-renderer-up-skin");
			itemRendererDownSkinTexture = atlas.getTexture("item-renderer-down-skin");
			itemRendererSelectedSkinTexture = atlas.getTexture("item-renderer-selected-skin");
			
			listDrillDownAccessoryTexture = atlas.getTexture("list-drill-down-accessory-icon"); 
			listDrillDownAccessorySelectedTexture = atlas.getTexture("list-drill-down-accessory-selected-icon");
			
			pageIndicatorNormalSkinTexture = atlas.getTexture("page-indicator-normal-skin");
			pageIndicatorSelectedSkinTexture = atlas.getTexture("page-indicator-selected-skin");
			
			panelBackgroundSkinTexture = atlas.getTexture("panel-background-skin");
			
			pickerListBackgroundSkinTexture = atlas.getTexture("picker-list-background-skin");			
			pickerListItemSelectedIconTexture = atlas.getTexture("picker-list-item-selected-icon");
			
			pickerListButtonIconTexture = atlas.getTexture("picker-list-button-icon");
			pickerListButtonSelectedIconTexture = atlas.getTexture("picker-list-button-selected-icon");
			pickerListButtonIconDisabledTexture = atlas.getTexture("picker-list-button-icon-disabled");
			
			horizontalProgressBarFillSkinTexture = atlas.getTexture("horizontal-progress-bar-fill-skin");
			horizontalProgressBarFillDisabledSkinTexture = atlas.getTexture("horizontal-progress-bar-fill-disabled-skin");
			horizontalProgressBarBackgroundSkinTexture = atlas.getTexture("horizontal-progress-bar-background-skin");
			horizontalProgressBarBackgroundDisabledSkinTexture = atlas.getTexture("horizontal-progress-bar-background-disabled-skin");
			
			verticalProgressBarFillSkinTexture = atlas.getTexture("vertical-progress-bar-fill-skin");
			verticalProgressBarFillDisabledSkinTexture = atlas.getTexture("vertical-progress-bar-fill-disabled-skin");
			verticalProgressBarBackgroundSkinTexture = atlas.getTexture("vertical-progress-bar-background-skin");
			verticalProgressBarBackgroundDisabledSkinTexture = atlas.getTexture("vertical-progress-bar-background-disabled-skin");
			
			radioUpIconTexture = atlas.getTexture("radio-up-icon");
			radioSelectedUpIconTexture = atlas.getTexture("radio-selected-up-icon");
			radioDownIconTexture = atlas.getTexture("radio-down-icon");
			radioDisabledIconTexture = atlas.getTexture("radio-disabled-icon");
			radioSelectedDownIconTexture = atlas.getTexture("radio-selected-down-icon");
			radioSelectedDisabledIconTexture = atlas.getTexture("radio-selected-disabled-icon");
			
			verticalScrollBarThumbSkinTexture = atlas.getTexture("vertical-scroll-bar-thumb-skin");
			horizontalScrollBarThumbSkinTexture = atlas.getTexture("horizontal-scroll-bar-thumb-skin");
			
			sliderButtonUpSkinTexture = atlas.getTexture("slider-button-up-skin");
			sliderButtonDownSkinTexture = atlas.getTexture("slider-button-down-skin");
			sliderButtonDisabledSkinTexture = atlas.getTexture("slider-button-disabled-skin");
			
			horizontalSliderMinimumTrackSkinTexture = atlas.getTexture("horizontal-slider-minimum-track-skin");
			horizontalSliderMinimumTrackDisabledSkinTexture = atlas.getTexture("horizontal-slider-minimum-track-disabled-skin");
			horizontalSliderMaximumTrackSkinTexture = atlas.getTexture("horizontal-slider-maximum-track-skin");
			horizontalSliderMaximumTrackDisabledSkinTexture = atlas.getTexture("horizontal-slider-maximum-track-disabled-skin");
			
			verticalSliderMinimumTrackSkinTexture = atlas.getTexture("vertical-slider-minimum-track-skin");
			verticalSliderMinimumTrackDisabledSkinTexture = atlas.getTexture("vertical-slider-minimum-track-disabled-skin");
			verticalSliderMaximumTrackSkinTexture = atlas.getTexture("vertical-slider-maximum-track-skin");
			verticalSliderMaximumTrackDisabledSkinTexture = atlas.getTexture("vertical-slider-maximum-track-disabled-skin");
			
			spinnerListBackgroundSkinTexture = atlas.getTexture("spinner-list-background-skin");
			spinnerListSelectionOverlaySkinTexture = atlas.getTexture("spinner-list-selection-overlay-skin");
			
			tabUpSkinTexture = atlas.getTexture("tab-up-skin");
			tabDownSkinTexture = atlas.getTexture("tab-down-skin");
			tabDisabledSkinTexture = atlas.getTexture("tab-disabled-skin");
			tabSelectedUpSkinTexture = atlas.getTexture("tab-selected-up-skin");
			tabSelectedDisabledSkinTexture = atlas.getTexture("tab-selected-disabled-skin");
			
			textInputBackgroundEnableSkinTexture = atlas.getTexture("text-input-background-enable-skin");
			textInputBackgroundFocusedSkinTexture = atlas.getTexture("text-input-background-focused-skin");
			textInputBackgroundErrorSkinTexture = atlas.getTexture("text-input-background-error-skin");
			textInputBackgroundDisabledSkinTexture = atlas.getTexture("text-input-background-disabled-skin");
			
			searchIconTexture = atlas.getTexture("search-icon");
			searchIconDisabledTexture = atlas.getTexture("search-icon-disabled");
			
			searchTextInputBackgroundEnableSkinTexture = atlas.getTexture("search-text-input-background-enable-skin");
			searchTextInputBackgroundFocusedSkinTexture = atlas.getTexture("search-text-input-background-focused-skin");
			searchTextInputBackgroundDisabledSkinTexture = atlas.getTexture("search-text-input-background-disabled-skin");			
			
			textAreaBackgroundEnableSkinTexture = atlas.getTexture("text-area-background-enable-skin");
			textAreaBackgroundFocusedSkinTexture = atlas.getTexture("text-area-background-focused-skin");
			textAreaBackgroundErrorSkinTexture = atlas.getTexture("text-area-background-error-skin");
			textAreaBackgroundDisabledSkinTexture = atlas.getTexture("text-area-background-disabled-skin");
			
			toggleSwitchOnTrackSkinTexture = atlas.getTexture("toggle-switch-on-track-skin");
			toggleSwitchOnTrackDisabledSkinTexture = atlas.getTexture("toggle-switch-on-track-disabled-skin");
			toggleSwitchOffTrackSkinTexture = atlas.getTexture("toggle-switch-off-track-skin");
			toggleSwitchOffTrackDisabledSkinTexture = atlas.getTexture("toggle-switch-off-track-disabled-skin");
			
			toggleSwitchOnThumbTexture = atlas.getTexture("toggle-switch-on-thumb-skin");
			toggleSwitchOffThumbTexture = atlas.getTexture("toggle-switch-off-thumb-skin");	
			toggleSwitchDisabledThumbTexture = atlas.getTexture("toggle-switch-disabled-thumb-skin");
		}
		
		protected function initializeStyleProviders():void
		{
			//alert
			getStyleProviderForClass(Alert).defaultStyleFunction = setAlertStyles;
			getStyleProviderForClass(ButtonGroup).setFunctionForStyleName(Alert.DEFAULT_CHILD_STYLE_NAME_BUTTON_GROUP, setAlertButtonGroupStyles);
			getStyleProviderForClass(Button).setFunctionForStyleName(THEME_STYLE_NAME_ALERT_BUTTON_GROUP_BUTTON, setAlertButtonGroupButtonStyles);
			getStyleProviderForClass(Header).setFunctionForStyleName(Alert.DEFAULT_CHILD_STYLE_NAME_HEADER, setHeaderWithoutBackgroundStyles);
			getStyleProviderForClass(TextBlockTextRenderer).setFunctionForStyleName(Alert.DEFAULT_CHILD_STYLE_NAME_MESSAGE, setAlertMessageTextRendererStyles);
			
			//button
			getStyleProviderForClass(Button).defaultStyleFunction = setButtonStyles;
			getStyleProviderForClass(Button).setFunctionForStyleName(THEME_STYLE_NAME_PRIMARY_BUTTON, setPrimaryButtonStyles);
			getStyleProviderForClass(Button).setFunctionForStyleName(Button.ALTERNATE_STYLE_NAME_CALL_TO_ACTION_BUTTON, setCallToActionButtonStyles);
			getStyleProviderForClass(Button).setFunctionForStyleName(Button.ALTERNATE_STYLE_NAME_QUIET_BUTTON, setQuietButtonStyles);
			getStyleProviderForClass(Button).setFunctionForStyleName(Button.ALTERNATE_STYLE_NAME_DANGER_BUTTON, setDangerButtonStyles);
			getStyleProviderForClass(Button).setFunctionForStyleName(Button.ALTERNATE_STYLE_NAME_BACK_BUTTON, setBackButtonStyles);
			getStyleProviderForClass(Button).setFunctionForStyleName(Button.ALTERNATE_STYLE_NAME_FORWARD_BUTTON, setForwardButtonStyles);
			
			getStyleProviderForClass(TextBlockTextRenderer).setFunctionForStyleName(Button.DEFAULT_CHILD_STYLE_NAME_LABEL, setButtonLabelStyles);			
			getStyleProviderForClass(TextBlockTextRenderer).setFunctionForStyleName(THEME_STYLE_NAME_PRIMARY_BUTTON_LABEL, setPrimaryButtonLabelStyles);
			getStyleProviderForClass(TextBlockTextRenderer).setFunctionForStyleName(THEME_STYLE_NAME_CALL_TO_ACTION_BUTTON_LABEL, setCallToActionButtonLabelStyles);
			getStyleProviderForClass(TextBlockTextRenderer).setFunctionForStyleName(THEME_STYLE_NAME_QUIET_BUTTON_LABEL, setQuietButtonLabelStyles);
			getStyleProviderForClass(TextBlockTextRenderer).setFunctionForStyleName(THEME_STYLE_NAME_DANGER_BUTTON_LABEL, setDangerButtonLabelStyles);
			getStyleProviderForClass(TextBlockTextRenderer).setFunctionForStyleName(THEME_STYLE_NAME_BACK_BUTTON_LABEL, setBackButtonLabelStyles);
			getStyleProviderForClass(TextBlockTextRenderer).setFunctionForStyleName(THEME_STYLE_NAME_FORWARD_BUTTON_LABEL, setForwardButtonLabelStyles);			
			
			//button group
			getStyleProviderForClass(ButtonGroup).defaultStyleFunction = setButtonGroupStyles;
			getStyleProviderForClass(Button).setFunctionForStyleName(ButtonGroup.DEFAULT_CHILD_STYLE_NAME_BUTTON, setButtonGroupButtonStyles);
			getStyleProviderForClass(ToggleButton).setFunctionForStyleName(ButtonGroup.DEFAULT_CHILD_STYLE_NAME_BUTTON, setButtonGroupButtonStyles);
			getStyleProviderForClass(TextBlockTextRenderer).setFunctionForStyleName(THEME_STYLE_NAME_BUTTON_GROUP_BUTTON_LABEL, setButtonGroupButtonLabelStyles);
			
			//callout
			getStyleProviderForClass(Callout).defaultStyleFunction = setCalloutStyles;
			
			//check
			getStyleProviderForClass(Check).defaultStyleFunction = setCheckStyles;
			getStyleProviderForClass(TextBlockTextRenderer).setFunctionForStyleName(Check.DEFAULT_CHILD_STYLE_NAME_LABEL, setCheckLabelStyles);
			
			//date time spinner
			getStyleProviderForClass(SpinnerList).setFunctionForStyleName(DateTimeSpinner.DEFAULT_CHILD_STYLE_NAME_LIST, setDateTimeSpinnerListStyles);
			getStyleProviderForClass(DefaultListItemRenderer).setFunctionForStyleName(THEME_STYLE_NAME_DATE_TIME_SPINNER_LIST_ITEM_RENDERER, setDateTimeSpinnerListItemRendererStyles);
			
			//drawers
			getStyleProviderForClass(Drawers).defaultStyleFunction = setDrawersStyles;
			
			//grouped list (see also: item renderers)
			getStyleProviderForClass(GroupedList).defaultStyleFunction = setGroupedListStyles;
			getStyleProviderForClass(GroupedList).setFunctionForStyleName(GroupedList.ALTERNATE_STYLE_NAME_INSET_GROUPED_LIST, setInsetGroupedListStyles);
			getStyleProviderForClass(DefaultGroupedListItemRenderer).defaultStyleFunction = setItemRendererStyles;
			getStyleProviderForClass(DefaultGroupedListItemRenderer).setFunctionForStyleName(GroupedList.ALTERNATE_CHILD_STYLE_NAME_INSET_ITEM_RENDERER, setInsetGroupedListMiddleItemRendererStyles);
			getStyleProviderForClass(DefaultGroupedListItemRenderer).setFunctionForStyleName(GroupedList.ALTERNATE_CHILD_STYLE_NAME_INSET_FIRST_ITEM_RENDERER, setInsetGroupedListFirstItemRendererStyles);
			getStyleProviderForClass(DefaultGroupedListItemRenderer).setFunctionForStyleName(GroupedList.ALTERNATE_CHILD_STYLE_NAME_INSET_LAST_ITEM_RENDERER, setInsetGroupedListLastItemRendererStyles);
			getStyleProviderForClass(DefaultGroupedListItemRenderer).setFunctionForStyleName(GroupedList.ALTERNATE_CHILD_STYLE_NAME_INSET_SINGLE_ITEM_RENDERER, setInsetGroupedListSingleItemRendererStyles);
			getStyleProviderForClass(DefaultGroupedListItemRenderer).setFunctionForStyleName(DefaultGroupedListItemRenderer.ALTERNATE_STYLE_NAME_DRILL_DOWN, setDrillDownItemRendererStyles);
			getStyleProviderForClass(DefaultGroupedListItemRenderer).setFunctionForStyleName(DefaultGroupedListItemRenderer.ALTERNATE_STYLE_NAME_CHECK, setCheckItemRendererStyles);
			
			//header
			getStyleProviderForClass(Header).defaultStyleFunction = setHeaderStyles;
			getStyleProviderForClass(TextBlockTextRenderer).setFunctionForStyleName(Header.DEFAULT_CHILD_STYLE_NAME_TITLE, setHeaderTitleStyles);
			
			//header and footer renderers for grouped list
			getStyleProviderForClass(DefaultGroupedListHeaderOrFooterRenderer).defaultStyleFunction = setGroupedListHeaderRendererStyles;
			getStyleProviderForClass(DefaultGroupedListHeaderOrFooterRenderer).setFunctionForStyleName(GroupedList.DEFAULT_CHILD_STYLE_NAME_FOOTER_RENDERER, setGroupedListFooterRendererStyles);
			getStyleProviderForClass(DefaultGroupedListHeaderOrFooterRenderer).setFunctionForStyleName(GroupedList.ALTERNATE_CHILD_STYLE_NAME_INSET_HEADER_RENDERER, setInsetGroupedListHeaderRendererStyles);
			getStyleProviderForClass(DefaultGroupedListHeaderOrFooterRenderer).setFunctionForStyleName(GroupedList.ALTERNATE_CHILD_STYLE_NAME_INSET_FOOTER_RENDERER, setInsetGroupedListFooterRendererStyles);
			getStyleProviderForClass(TextBlockTextRenderer).setFunctionForStyleName(DefaultGroupedListHeaderOrFooterRenderer.DEFAULT_CHILD_STYLE_NAME_CONTENT_LABEL, setGroupedListHeaderContentLabelStyles);
			getStyleProviderForClass(TextBlockTextRenderer).setFunctionForStyleName(THEME_STYLE_NAME_GROUPED_LIST_FOOTER_CONTENT_LABEL, setGroupedListFooterContentLabelStyles);
			
			//labels
			getStyleProviderForClass(Label).setFunctionForStyleName(Label.ALTERNATE_STYLE_NAME_HEADING, setHeadingLabelStyles);
			getStyleProviderForClass(Label).setFunctionForStyleName(Label.ALTERNATE_STYLE_NAME_DETAIL, setDetailLabelStyles);
			getStyleProviderForClass(TextBlockTextRenderer).setFunctionForStyleName(Label.DEFAULT_CHILD_STYLE_NAME_TEXT_RENDERER, setLabelTextRendererStyles);
			getStyleProviderForClass(TextBlockTextRenderer).setFunctionForStyleName(THEME_STYLE_NAME_HEADING_LABEL_TEXT_RENDERER, setHeadingLabelTextRendererStyles);
			getStyleProviderForClass(TextBlockTextRenderer).setFunctionForStyleName(THEME_STYLE_NAME_DETAIL_LABEL_TEXT_RENDERER, setDetailLabelTextRendererStyles);
			
			//layout group
			getStyleProviderForClass(LayoutGroup).setFunctionForStyleName(LayoutGroup.ALTERNATE_STYLE_NAME_TOOLBAR, setToolbarLayoutGroupStyles);
			
			//list (see also: item renderers)
			getStyleProviderForClass(List).defaultStyleFunction = setListStyles;
			getStyleProviderForClass(DefaultListItemRenderer).defaultStyleFunction = setItemRendererStyles;
			getStyleProviderForClass(DefaultListItemRenderer).setFunctionForStyleName(DefaultListItemRenderer. ALTERNATE_STYLE_NAME_DRILL_DOWN, setDrillDownItemRendererStyles);
			getStyleProviderForClass(DefaultListItemRenderer).setFunctionForStyleName(DefaultListItemRenderer.ALTERNATE_STYLE_NAME_CHECK, setCheckItemRendererStyles);
			getStyleProviderForClass(TextBlockTextRenderer).setFunctionForStyleName(BaseDefaultItemRenderer.DEFAULT_CHILD_STYLE_NAME_LABEL, setItemRendererLabelStyles);
			getStyleProviderForClass(TextBlockTextRenderer).setFunctionForStyleName(BaseDefaultItemRenderer.DEFAULT_CHILD_STYLE_NAME_ACCESSORY_LABEL, setItemRendererAccessoryLabelStyles);
			getStyleProviderForClass(TextBlockTextRenderer).setFunctionForStyleName(BaseDefaultItemRenderer.DEFAULT_CHILD_STYLE_NAME_ICON_LABEL, setItemRendererIconLabelStyles);
			getStyleProviderForClass(TextBlockTextRenderer).setFunctionForStyleName(THEME_STYLE_NAME_CHECK_ITEM_RENDERER_LABEL, setCheckItemRendererLabelStyles);
			getStyleProviderForClass(TextBlockTextRenderer).setFunctionForStyleName(THEME_STYLE_NAME_CHECK_ITEM_RENDERER_ICON_LABEL, setCheckItemRendererIconLabelStyles);
			getStyleProviderForClass(TextBlockTextRenderer).setFunctionForStyleName(THEME_STYLE_NAME_CHECK_ITEM_RENDERER_ACCESSORY_LABEL, setCheckItemRendererAccessoryLabelStyles);
			
			//numeric stepper
			getStyleProviderForClass(NumericStepper).defaultStyleFunction = setNumericStepperStyles;
			getStyleProviderForClass(TextInput).setFunctionForStyleName(NumericStepper.DEFAULT_CHILD_STYLE_NAME_TEXT_INPUT, setNumericStepperTextInputStyles);
			getStyleProviderForClass(TextBlockTextEditor).setFunctionForStyleName(THEME_STYLE_NAME_NUMERIC_STEPPER_TEXT_INPUT_EDITOR, setNumericStepperTextInputEditorStyles);
			getStyleProviderForClass(Button).setFunctionForStyleName(NumericStepper.DEFAULT_CHILD_STYLE_NAME_DECREMENT_BUTTON, setNumericStepperButtonStyles);
			getStyleProviderForClass(Button).setFunctionForStyleName(NumericStepper.DEFAULT_CHILD_STYLE_NAME_INCREMENT_BUTTON, setNumericStepperButtonStyles);
			
			//page indicator
			getStyleProviderForClass(PageIndicator).defaultStyleFunction = setPageIndicatorStyles;
			
			//panel
			getStyleProviderForClass(Panel).defaultStyleFunction = setPanelStyles;
			getStyleProviderForClass(Header).setFunctionForStyleName(Panel.DEFAULT_CHILD_STYLE_NAME_HEADER, setHeaderWithoutBackgroundStyles);
			
			//panel screen
			getStyleProviderForClass(PanelScreen).defaultStyleFunction = setPanelScreenStyles;
			getStyleProviderForClass(Header).setFunctionForStyleName(PanelScreen.DEFAULT_CHILD_STYLE_NAME_HEADER, setPanelScreenHeaderStyles);
			
			//picker list (see also: list and item renderers)
			getStyleProviderForClass(PickerList).defaultStyleFunction = setPickerListStyles;
			getStyleProviderForClass(List).setFunctionForStyleName(PickerList.DEFAULT_CHILD_STYLE_NAME_LIST, setPickerListPopUpListStyles);
			getStyleProviderForClass(Button).setFunctionForStyleName(PickerList.DEFAULT_CHILD_STYLE_NAME_BUTTON, setPickerListButtonStyles);
			getStyleProviderForClass(ToggleButton).setFunctionForStyleName(PickerList.DEFAULT_CHILD_STYLE_NAME_BUTTON, setPickerListButtonStyles);
			
			//progress bar
			getStyleProviderForClass(ProgressBar).defaultStyleFunction = setProgressBarStyles;
			
			//radio
			getStyleProviderForClass(Radio).defaultStyleFunction = setRadioStyles;
			getStyleProviderForClass(TextBlockTextRenderer).setFunctionForStyleName(Radio.DEFAULT_CHILD_STYLE_NAME_LABEL, setRadioLabelStyles);
			
			//scroll container
			getStyleProviderForClass(ScrollContainer).defaultStyleFunction = setScrollContainerStyles;
			getStyleProviderForClass(ScrollContainer).setFunctionForStyleName(ScrollContainer.ALTERNATE_STYLE_NAME_TOOLBAR, setToolbarScrollContainerStyles);
			
			//scroll screen
			getStyleProviderForClass(ScrollScreen).defaultStyleFunction = setScrollScreenStyles;
			
			//scroll text
			getStyleProviderForClass(ScrollText).defaultStyleFunction = setScrollTextStyles;
			
			//simple scroll bar
			getStyleProviderForClass(SimpleScrollBar).defaultStyleFunction = setSimpleScrollBarStyles;
			getStyleProviderForClass(Button).setFunctionForStyleName(THEME_STYLE_NAME_HORIZONTAL_SIMPLE_SCROLL_BAR_THUMB, setHorizontalSimpleScrollBarThumbStyles);
			getStyleProviderForClass(Button).setFunctionForStyleName(THEME_STYLE_NAME_VERTICAL_SIMPLE_SCROLL_BAR_THUMB, setVerticalSimpleScrollBarThumbStyles);
			
			//slider
			getStyleProviderForClass(Slider).defaultStyleFunction = setSliderStyles;
			getStyleProviderForClass(Button).setFunctionForStyleName(Slider.DEFAULT_CHILD_STYLE_NAME_THUMB, setSliderButtonStyles);
			getStyleProviderForClass(Button).setFunctionForStyleName(THEME_STYLE_NAME_HORIZONTAL_SLIDER_MINIMUM_TRACK, setHorizontalSliderMinimumTrackStyles);
			getStyleProviderForClass(Button).setFunctionForStyleName(THEME_STYLE_NAME_HORIZONTAL_SLIDER_MAXIMUM_TRACK, setHorizontalSliderMaximumTrackStyles);
			getStyleProviderForClass(Button).setFunctionForStyleName(THEME_STYLE_NAME_VERTICAL_SLIDER_MINIMUM_TRACK, setVerticalSliderMinimumTrackStyles);
			getStyleProviderForClass(Button).setFunctionForStyleName(THEME_STYLE_NAME_VERTICAL_SLIDER_MAXIMUM_TRACK, setVerticalSliderMaximumTrackStyles);
			
			//spinner list
			getStyleProviderForClass(SpinnerList).defaultStyleFunction = setSpinnerListStyles;
			getStyleProviderForClass(DefaultListItemRenderer).setFunctionForStyleName(THEME_STYLE_NAME_SPINNER_LIST_ITEM_RENDERER, setSpinnerListItemRendererStyles);
			getStyleProviderForClass(TextBlockTextRenderer).setFunctionForStyleName(THEME_STYLE_NAME_SPINNER_LIST_ITEM_RENDERER_LABEL, setSpinnerListItemRendererLabelStyles);
			getStyleProviderForClass(TextBlockTextRenderer).setFunctionForStyleName(THEME_STYLE_NAME_SPINNER_LIST_ITEM_RENDERER_ICON_LABEL, setSpinnerListItemRendererIconLabelStyles);
			getStyleProviderForClass(TextBlockTextRenderer).setFunctionForStyleName(THEME_STYLE_NAME_SPINNER_LIST_ITEM_RENDERER_ACCESSORY_LABEL, setSpinnerListItemRendererAccessoryLabelStyles);
			
			//tab bar
			getStyleProviderForClass(TabBar).defaultStyleFunction = setTabBarStyles;
			getStyleProviderForClass(ToggleButton).setFunctionForStyleName(TabBar.DEFAULT_CHILD_STYLE_NAME_TAB, setTabStyles);
			getStyleProviderForClass(TextBlockTextRenderer).setFunctionForStyleName(THEME_STYLE_NAME_TAB_LABEL, setTabLabelStyles);
			
			//text input
			getStyleProviderForClass(TextInput).defaultStyleFunction = setTextInputStyles;
			getStyleProviderForClass(TextInput).setFunctionForStyleName(TextInput.ALTERNATE_STYLE_NAME_SEARCH_TEXT_INPUT, setSearchTextInputStyles);
			getStyleProviderForClass(TextBlockTextRenderer).setFunctionForStyleName(TextInput.DEFAULT_CHILD_STYLE_NAME_PROMPT, setTextInputPromptStyles);
			getStyleProviderForClass(StageTextTextEditor).setFunctionForStyleName(TextInput.DEFAULT_CHILD_STYLE_NAME_TEXT_EDITOR, setTextInputTextEditorStyles);
			getStyleProviderForClass(TextCallout).setFunctionForStyleName(TextInput.DEFAULT_CHILD_STYLE_NAME_ERROR_CALLOUT, setTextInputErrorCalloutStyles);
			
			//text area
			getStyleProviderForClass(TextArea).defaultStyleFunction = setTextAreaStyles;
			getStyleProviderForClass(TextFieldTextEditorViewPort).setFunctionForStyleName(TextArea.DEFAULT_CHILD_STYLE_NAME_TEXT_EDITOR, setTextAreaTextEditorStyles);
			getStyleProviderForClass(TextCallout).setFunctionForStyleName(TextArea.DEFAULT_CHILD_STYLE_NAME_ERROR_CALLOUT, setTextAreaErrorCalloutStyles);
			
			//text callout
			getStyleProviderForClass(TextCallout).defaultStyleFunction = setTextCalloutStyles;
			getStyleProviderForClass(TextBlockTextRenderer).setFunctionForStyleName(TextCallout.DEFAULT_CHILD_STYLE_NAME_TEXT_RENDERER, setTextCalloutTextRendererStyles);
			
			//toggle button
			getStyleProviderForClass(ToggleButton).defaultStyleFunction = setButtonStyles;
			getStyleProviderForClass(ToggleButton).setFunctionForStyleName(Button.ALTERNATE_STYLE_NAME_QUIET_BUTTON, setQuietButtonStyles);
			
			//toggle switch
			getStyleProviderForClass(ToggleSwitch).defaultStyleFunction = setToggleSwitchStyles;
			getStyleProviderForClass(Button).setFunctionForStyleName(ToggleSwitch.DEFAULT_CHILD_STYLE_NAME_ON_TRACK, setToggleSwitchOnTrackStyles);
			getStyleProviderForClass(Button).setFunctionForStyleName(ToggleSwitch.DEFAULT_CHILD_STYLE_NAME_OFF_TRACK, setToggleSwitchOffTrackStyles);			
			getStyleProviderForClass(Button).setFunctionForStyleName(ToggleSwitch.DEFAULT_CHILD_STYLE_NAME_THUMB, setToggleSwitchThumbStyles);
			getStyleProviderForClass(ToggleButton).setFunctionForStyleName(ToggleSwitch.DEFAULT_CHILD_STYLE_NAME_THUMB, setToggleSwitchThumbStyles);
		}
		
		protected function pageIndicatorNormalSymbolFactory():DisplayObject
		{
			var symbol:ImageLoader = new ImageLoader();
			symbol.source = pageIndicatorNormalSkinTexture;
			return symbol;
		}
		
		protected function pageIndicatorSelectedSymbolFactory():DisplayObject
		{
			var symbol:ImageLoader = new ImageLoader();
			symbol.source = pageIndicatorSelectedSkinTexture;
			return symbol;
		}
		
		//-------------------------
		// Shared
		//-------------------------
		
		protected function setScrollerStyles(scroller:Scroller):void
		{
			scroller.verticalScrollBarFactory = scrollBarFactory;
			scroller.horizontalScrollBarFactory = scrollBarFactory;
		}
		
		protected function setSimpleButtonStyles(button:Button):void
		{
			var skin:ImageSkin = new ImageSkin(buttonUpSkinTexture);
			skin.setTextureForState(ButtonState.DOWN, buttonDownSkinTexture);
			skin.setTextureForState(ButtonState.DISABLED, buttonDisabledSkinTexture);
			skin.scale9Grid = BUTTON_SCALE9_GRID;
			skin.width = controlSize;
			skin.height = controlSize;
			
			button.defaultSkin = skin;	
			button.hasLabelTextRenderer = false;			
			button.minWidth = button.minHeight = controlSize;
			button.minTouchWidth = button.minTouchHeight = gridSize;
		}
		
		//-------------------------
		// Alert
		//-------------------------
		
		protected function setAlertStyles(alert:Alert):void
		{
			setScrollerStyles(alert);
			
			var backgroundSkin:Image = new Image(alertBackgroundSkinTexture);
			backgroundSkin.scale9Grid = ALERT_BACKGROUND_SCALE9_GRID;
			
			alert.backgroundSkin = backgroundSkin;						
			alert.paddingTop = gutterSize;
			alert.paddingRight = gutterSize;
			alert.paddingBottom = smallGutterSize;
			alert.paddingLeft = gutterSize;
			alert.outerPadding = borderSize;
			alert.gap = smallGutterSize;
			alert.maxWidth = popUpFillSize;
			alert.maxHeight = popUpFillSize;
		}
		
		//see Panel section for Header styles
		
		protected function setAlertButtonGroupStyles(group:ButtonGroup):void
		{
			group.direction = Direction.HORIZONTAL;
			group.horizontalAlign = HorizontalAlign.CENTER;
			group.verticalAlign = VerticalAlign.JUSTIFY;
			group.distributeButtonSizes = false;
			group.gap = smallGutterSize;
			group.padding = smallGutterSize;
			group.customButtonStyleName = THEME_STYLE_NAME_ALERT_BUTTON_GROUP_BUTTON;
		}
		
		protected function setAlertButtonGroupButtonStyles(button:Button):void
		{
			setButtonStyles(button);
			
			button.minWidth = 2 * controlSize;
		}
		
		protected function setAlertMessageTextRendererStyles(renderer:TextBlockTextRenderer):void
		{
			renderer.wordWrap = true;
			renderer.elementFormat = alertMessageElementFormat;
		}
		
		//-------------------------
		// Button
		//-------------------------
		
		protected function setBaseButtonStyles(button:Button):void
		{
			button.paddingTop = smallControlGutterSize;
			button.paddingBottom = smallControlGutterSize;
			button.paddingLeft = gutterSize;
			button.paddingRight = gutterSize;
			button.gap = smallControlGutterSize;
			button.minGap = smallControlGutterSize;
			button.minWidth = button.minHeight = controlSize;
			button.minTouchWidth = gridSize;
			button.minTouchHeight = gridSize;
		}
		
		protected function setButtonStyles(button:Button):void
		{
			var skin:ImageSkin = new ImageSkin(buttonUpSkinTexture);
			skin.setTextureForState(ButtonState.DOWN, buttonDownSkinTexture);
			skin.setTextureForState(ButtonState.DISABLED, buttonDisabledSkinTexture);
			
			if(button is ToggleButton)
			{
				skin.selectedTexture = toggleButtonSelectedUpSkinTexture;
				skin.setTextureForState(ButtonState.DISABLED_AND_SELECTED, toggleButtonSelectedDisabledSkinTexture);
			}
			
			skin.scale9Grid = BUTTON_SCALE9_GRID;
			skin.width = controlSize;
			skin.height = controlSize;
			
			button.defaultSkin = skin;
			
			setBaseButtonStyles(button);
		}
		
		protected function setButtonLabelStyles(textRenderer:TextBlockTextRenderer):void
		{
			textRenderer.elementFormat = buttonElementFormat;
			textRenderer.disabledElementFormat = buttonDisabledElementFormat;
		}
		
		protected function setPrimaryButtonStyles(button:Button):void
		{
			var skin:ImageSkin = new ImageSkin(primaryButtonUpSkinTexture);
			skin.setTextureForState(ButtonState.DOWN, primaryButtonDownSkinTexture);
			skin.setTextureForState(ButtonState.DISABLED, primaryButtonDisabledSkinTexture);
			
			if(button is ToggleButton)
			{
				skin.selectedTexture = toggleButtonSelectedUpSkinTexture;
				skin.setTextureForState(ButtonState.DISABLED_AND_SELECTED, toggleButtonSelectedDisabledSkinTexture);
			}
			
			skin.scale9Grid = PRIMARY_BUTTON_SCALE9_GRID;
			skin.width = controlSize;
			skin.height = controlSize;
			
			button.defaultSkin = skin;
			button.customLabelStyleName = THEME_STYLE_NAME_PRIMARY_BUTTON_LABEL;
			
			setBaseButtonStyles(button);
		}
		
		protected function setPrimaryButtonLabelStyles(textRenderer:TextBlockTextRenderer):void
		{
			textRenderer.elementFormat = primaryButtonElementFormat;
			textRenderer.disabledElementFormat = primaryButtonDisabledElementFormat;
		}
		
		protected function setCallToActionButtonStyles(button:Button):void
		{
			var skin:ImageSkin = new ImageSkin(callToActionButtonUpSkinTexture);
			skin.setTextureForState(ButtonState.DOWN, callToActionButtonDownSkinTexture);
			skin.setTextureForState(ButtonState.DISABLED, callToActionButtonDisabledSkinTexture);
			skin.scale9Grid = CALL_TO_ACTION_BUTTON_SCALE9_GRID;
			skin.width = controlSize;
			skin.height = controlSize;
			
			button.defaultSkin = skin;
			button.customLabelStyleName = THEME_STYLE_NAME_CALL_TO_ACTION_BUTTON_LABEL;
			
			setBaseButtonStyles(button);
		}
		
		protected function setCallToActionButtonLabelStyles(textRenderer:TextBlockTextRenderer):void
		{
			textRenderer.elementFormat = callToActionButtonElementFormat;
			textRenderer.disabledElementFormat = callToActionButtonDisabledElementFormat;
		}
		
		protected function setQuietButtonStyles(button:Button):void
		{
			var defaultSkin:Quad = new Quad(controlSize, controlSize, 0xff00ff);
			defaultSkin.alpha = 0;
			button.defaultSkin = defaultSkin;
			
			var otherSkin:ImageSkin = new ImageSkin(null);
			otherSkin.setTextureForState(ButtonState.DOWN, quietButtonDownSkinTexture);
			otherSkin.setTextureForState(ButtonState.DISABLED, quietButtonDisabledSkinTexture);
			button.downSkin = otherSkin;
			button.disabledSkin = otherSkin;
			
			if(button is ToggleButton)
			{
				otherSkin.selectedTexture = toggleButtonSelectedUpSkinTexture;
				ToggleButton(button).defaultSelectedSkin = otherSkin;
			}
			
			otherSkin.scale9Grid = QUIET_BUTTON_SCALE9_GRID;
			otherSkin.width = controlSize;
			otherSkin.height = controlSize;
			
			button.customLabelStyleName = THEME_STYLE_NAME_QUIET_BUTTON_LABEL;
			
			button.paddingTop = smallControlGutterSize;
			button.paddingBottom = smallControlGutterSize;
			button.paddingLeft = smallGutterSize;
			button.paddingRight = smallGutterSize;
			button.gap = smallControlGutterSize;
			button.minGap = smallControlGutterSize;
			button.minWidth = button.minHeight = controlSize;
			button.minTouchWidth = button.minTouchHeight = gridSize;
		}
		
		protected function setQuietButtonLabelStyles(textRenderer:TextBlockTextRenderer):void
		{
			textRenderer.elementFormat = quietButtonElementFormat;
			textRenderer.setElementFormatForState(Button.STATE_DOWN, quietButtonDownElementFormat);
			textRenderer.setElementFormatForState(Button.STATE_DISABLED, quietButtonDisabledElementFormat);
			
			if(textRenderer.stateContext is ToggleButton)
			{
				textRenderer.setElementFormatForState(ToggleButton.STATE_DISABLED_AND_SELECTED, quietButtonDisabledElementFormat);
			}
		}
		
		protected function setDangerButtonStyles(button:Button):void
		{
			var skin:ImageSkin = new ImageSkin(dangerButtonUpSkinTexture);
			skin.setTextureForState(ButtonState.DOWN, dangerButtonDownSkinTexture);
			skin.setTextureForState(ButtonState.DISABLED, dangerButtonDisabledSkinTexture);
			skin.scale9Grid = DANGER_BUTTON_SCALE9_GRID;
			skin.width = controlSize;
			skin.height = controlSize;
			
			button.defaultSkin = skin;
			button.customLabelStyleName = THEME_STYLE_NAME_DANGER_BUTTON_LABEL;
			
			setBaseButtonStyles(button);
		}
		
		protected function setDangerButtonLabelStyles(textRenderer:TextBlockTextRenderer):void
		{
			textRenderer.elementFormat = dangerButtonElementFormat;
			textRenderer.disabledElementFormat = dangerButtonDisabledElementFormat;
		}
		
		protected function setBackButtonStyles(button:Button):void
		{
			var skin:ImageSkin = new ImageSkin(backButtonUpSkinTexture);
			skin.setTextureForState(ButtonState.DOWN, backButtonDownSkinTexture);
			skin.setTextureForState(ButtonState.DISABLED, backButtonDisabledSkinTexture);
			skin.scale9Grid = BACK_BUTTON_SCALE9_GRID;
			skin.width = controlSize;
			skin.height = controlSize;
			
			var icon:ImageSkin = new ImageSkin(buttonBackUpIconTexture);
			icon.setTextureForState(ButtonState.DOWN, buttonBackDownIconTexture);
			
			button.downSkin = skin;
			button.disabledSkin = skin;
			button.defaultIcon = icon;
			
			setBaseButtonStyles(button);
			
			button.customLabelStyleName = THEME_STYLE_NAME_BACK_BUTTON_LABEL;
			
			button.gap = 5;
		}
		
		protected function setBackButtonLabelStyles(textRenderer:TextBlockTextRenderer):void
		{
			textRenderer.elementFormat = backButtonElementFormat;
			textRenderer.setElementFormatForState(Button.STATE_DOWN, backButtonDownElementFormat);
			textRenderer.setElementFormatForState(Button.STATE_DISABLED, backButtonDisabledElementFormat);
			
			if(textRenderer.stateContext is ToggleButton)
			{
				textRenderer.setElementFormatForState(ToggleButton.STATE_DISABLED_AND_SELECTED, backButtonDisabledElementFormat);
			}
		}
		
		protected function setForwardButtonStyles(button:Button):void
		{			
			var skin:ImageSkin = new ImageSkin(forwardButtonUpSkinTexture);
			skin.setTextureForState(ButtonState.DOWN, forwardButtonDownSkinTexture);
			skin.setTextureForState(ButtonState.DISABLED, forwardButtonDisabledSkinTexture);
			skin.scale9Grid = FORWARD_BUTTON_SCALE9_GRID;
			skin.width = controlSize;
			skin.height = controlSize;
			
			var icon:ImageSkin = new ImageSkin(buttonForwardUpIconTexture);
			icon.setTextureForState(ButtonState.DOWN, buttonForwardDownIconTexture);
			
			button.downSkin = skin;
			button.disabledSkin = skin;
			button.defaultIcon = icon;
			
			setBaseButtonStyles(button);
			
			button.customLabelStyleName = THEME_STYLE_NAME_FORWARD_BUTTON_LABEL;			
			
			button.gap = 5;
			button.iconPosition = Button.ICON_POSITION_RIGHT;
		}
		
		protected function setForwardButtonLabelStyles(textRenderer:TextBlockTextRenderer):void
		{
			textRenderer.elementFormat = forwardButtonElementFormat;
			textRenderer.setElementFormatForState(Button.STATE_DOWN, forwardButtonDownElementFormat);
			textRenderer.setElementFormatForState(Button.STATE_DISABLED, forwardButtonDisabledElementFormat);
			
			if(textRenderer.stateContext is ToggleButton)
			{
				textRenderer.setElementFormatForState(ToggleButton.STATE_DISABLED_AND_SELECTED, forwardButtonDisabledElementFormat);
			}
		}
		
		//-------------------------
		// ButtonGroup
		//-------------------------
		
		protected function setButtonGroupStyles(group:ButtonGroup):void
		{
			group.minWidth = popUpFillSize;
			group.gap = smallGutterSize;
		}
		
		protected function setButtonGroupButtonStyles(button:Button):void
		{
			var skin:ImageSkin = new ImageSkin(buttonUpSkinTexture);
			skin.setTextureForState(ButtonState.DOWN, buttonDownSkinTexture);
			skin.setTextureForState(ButtonState.DISABLED, buttonDisabledSkinTexture);
			
			if(button is ToggleButton)
			{
				skin.selectedTexture = toggleButtonSelectedUpSkinTexture;
				skin.setTextureForState(ButtonState.DISABLED_AND_SELECTED, toggleButtonSelectedDisabledSkinTexture);
			}
			
			skin.scale9Grid = BUTTON_SCALE9_GRID;
			skin.width = gridSize;
			skin.height = gridSize;
			
			button.defaultSkin = skin;
			
			button.customLabelStyleName = THEME_STYLE_NAME_BUTTON_GROUP_BUTTON_LABEL;
			
			button.paddingTop = smallGutterSize;
			button.paddingBottom = smallGutterSize;
			button.paddingLeft = gutterSize;
			button.paddingRight = gutterSize;
			button.gap = smallGutterSize;
			button.minGap = smallGutterSize;
			button.minWidth = gridSize;
			button.minHeight = gridSize;
			button.minTouchWidth = gridSize;
			button.minTouchHeight = gridSize;
		}
		
		protected function setButtonGroupButtonLabelStyles(textRenderer:TextBlockTextRenderer):void
		{
			textRenderer.elementFormat = buttonGroupElementFormat;
			textRenderer.disabledElementFormat = buttonGroupDisabledElementFormat;
		}
		
		//-------------------------
		// Callout
		//-------------------------
		
		protected function setCalloutStyles(callout:Callout):void
		{
			var backgroundSkin:Image = new Image(calloutBackgroundSkinTexture);
			backgroundSkin.scale9Grid = CALLOUT_BACKGROUND_SCALE9_GRID;
			backgroundSkin.width = calloutBackgroundMinSize;
			backgroundSkin.height = calloutBackgroundMinSize;
			callout.backgroundSkin = backgroundSkin;
			
			var topArrowSkin:Image = new Image(calloutTopArrowSkinTexture);
			callout.topArrowSkin = topArrowSkin;
			callout.topArrowGap = calloutArrowOverlapGap;
			
			var rightArrowSkin:Image = new Image(calloutRightArrowSkinTexture);
			callout.rightArrowSkin = rightArrowSkin;
			callout.rightArrowGap = calloutArrowOverlapGap;
			
			var bottomArrowSkin:Image = new Image(calloutBottomArrowSkinTexture);
			callout.bottomArrowSkin = bottomArrowSkin;
			callout.bottomArrowGap = calloutArrowOverlapGap;
			
			var leftArrowSkin:Image = new Image(calloutLeftArrowSkinTexture);
			callout.leftArrowSkin = leftArrowSkin;
			callout.leftArrowGap = calloutArrowOverlapGap;
			
			callout.padding = smallGutterSize;
		}
		
		protected function setDangerCalloutStyles(callout:Callout):void
		{
			var backgroundSkin:Image = new Image(dangerCalloutBackgroundSkinTexture);
			backgroundSkin.scale9Grid = DANGER_CALLOUT_BACKGROUND_SCALE9_GRID;
			backgroundSkin.width = calloutBackgroundMinSize;
			backgroundSkin.height = calloutBackgroundMinSize;
			callout.backgroundSkin = backgroundSkin;
			
			var topArrowSkin:Image = new Image(dangerCalloutTopArrowSkinTexture);
			callout.topArrowSkin = topArrowSkin;
			callout.topArrowGap = calloutArrowOverlapGap;
			
			var rightArrowSkin:Image = new Image(dangerCalloutRightArrowSkinTexture);
			callout.rightArrowSkin = rightArrowSkin;
			callout.rightArrowGap = calloutArrowOverlapGap;
			
			var bottomArrowSkin:Image = new Image(dangerCalloutBottomArrowSkinTexture);
			callout.bottomArrowSkin = bottomArrowSkin;
			callout.bottomArrowGap = calloutArrowOverlapGap;
			
			var leftArrowSkin:Image = new Image(dangerCalloutLeftArrowSkinTexture);
			callout.leftArrowSkin = leftArrowSkin;
			callout.leftArrowGap = calloutArrowOverlapGap;
			
			callout.padding = smallGutterSize;
		}
		
		//-------------------------
		// Check
		//-------------------------
		
		protected function setCheckStyles(check:Check):void
		{
			var icon:ImageSkin = new ImageSkin(checkUpIconTexture);
			icon.selectedTexture = checkSelectedUpIconTexture;
			icon.setTextureForState(ButtonState.DOWN, checkDownIconTexture);
			icon.setTextureForState(ButtonState.DISABLED, checkDisabledIconTexture);
			icon.setTextureForState(ButtonState.DOWN_AND_SELECTED, checkSelectedDownIconTexture);
			icon.setTextureForState(ButtonState.DISABLED_AND_SELECTED, checkSelectedDisabledIconTexture);
			check.defaultIcon = icon;
			
			check.horizontalAlign = HorizontalAlign.LEFT;
			check.gap = smallControlGutterSize;
			check.minGap = smallControlGutterSize;
			check.minWidth = controlSize;
			check.minHeight = controlSize;
			check.minTouchWidth = gridSize;
			check.minTouchHeight = gridSize;
		}
		
		protected function setCheckLabelStyles(textRenderer:TextBlockTextRenderer):void
		{
			textRenderer.elementFormat = checkElementFormat;
			textRenderer.disabledElementFormat = checkDisabledElementFormat;
		}
		
		//-------------------------
		// DateTimeSpinner
		//-------------------------
		
		protected function setDateTimeSpinnerListStyles(list:SpinnerList):void
		{
			setSpinnerListStyles(list);
			list.customItemRendererStyleName = THEME_STYLE_NAME_DATE_TIME_SPINNER_LIST_ITEM_RENDERER;
		}
		
		protected function setDateTimeSpinnerListItemRendererStyles(itemRenderer:DefaultListItemRenderer):void
		{
			setSpinnerListItemRendererStyles(itemRenderer);
			itemRenderer.accessoryPosition = RelativePosition.LEFT;
			itemRenderer.gap = smallGutterSize;
			itemRenderer.minGap = smallGutterSize;
			itemRenderer.accessoryGap = smallGutterSize;
			itemRenderer.minAccessoryGap = smallGutterSize;
		}
		
		//-------------------------
		// Drawers
		//-------------------------
		
		protected function setDrawersStyles(drawers:Drawers):void
		{
			var overlaySkin:Quad = new Quad(10, 10, DRAWER_OVERLAY_COLOR);
			overlaySkin.alpha = DRAWER_OVERLAY_ALPHA;
			drawers.overlaySkin = overlaySkin;
			
			var topDrawerDivider:Quad = new Quad(borderSize, borderSize, DRAWER_OVERLAY_COLOR);
			drawers.topDrawerDivider = topDrawerDivider;
			
			var rightDrawerDivider:Quad = new Quad(borderSize, borderSize, DRAWER_OVERLAY_COLOR);
			drawers.rightDrawerDivider = rightDrawerDivider;
			
			var bottomDrawerDivider:Quad = new Quad(borderSize, borderSize, DRAWER_OVERLAY_COLOR);
			drawers.bottomDrawerDivider = bottomDrawerDivider;
			
			var leftDrawerDivider:Quad = new Quad(borderSize, borderSize, DRAWER_OVERLAY_COLOR);
			drawers.leftDrawerDivider = leftDrawerDivider;
		}
		
		
		//-------------------------
		// GroupedList
		//-------------------------
		
		protected function setGroupedListStyles(list:GroupedList):void
		{
			setScrollerStyles(list);
			var backgroundSkin:Quad = new Quad(gridSize, gridSize, LIST_BACKGROUND_COLOR);
			list.backgroundSkin = backgroundSkin;
		}
		
		//see List section for item renderer styles
		
		protected function setGroupedListHeaderRendererStyles(renderer:DefaultGroupedListHeaderOrFooterRenderer):void
		{
			renderer.backgroundSkin = new Quad(1, 1, GROUPED_LIST_HEADER_BACKGROUND_COLOR);
			
			renderer.horizontalAlign = HorizontalAlign.LEFT;
			renderer.paddingTop = smallGutterSize;
			renderer.paddingBottom = smallGutterSize;
			renderer.paddingLeft = smallGutterSize + gutterSize;
			renderer.paddingRight = gutterSize;
		}
		
		protected function setGroupedListFooterRendererStyles(renderer:DefaultGroupedListHeaderOrFooterRenderer):void
		{
			renderer.backgroundSkin = new Quad(1, 1, GROUPED_LIST_FOOTER_BACKGROUND_COLOR);
			
			renderer.customContentLabelStyleName = THEME_STYLE_NAME_GROUPED_LIST_FOOTER_CONTENT_LABEL;
			
			renderer.horizontalAlign = HorizontalAlign.CENTER;
			renderer.paddingTop = renderer.paddingBottom = smallGutterSize;
			renderer.paddingLeft = smallGutterSize + gutterSize;
			renderer.paddingRight = gutterSize;
		}
		
		protected function setGroupedListHeaderContentLabelStyles(textRenderer:TextBlockTextRenderer):void
		{
			textRenderer.elementFormat = groupedListHeaderElementFormat;
			textRenderer.disabledElementFormat = groupedListHeaderDisabledElementFormat;
		}
		
		protected function setGroupedListFooterContentLabelStyles(textRenderer:TextBlockTextRenderer):void
		{
			textRenderer.elementFormat = groupedListFooterElementFormat;
			textRenderer.disabledElementFormat = groupedListFooterDisabledElementFormat;
		}
		
		protected function setInsetGroupedListStyles(list:GroupedList):void
		{
			list.customItemRendererStyleName = GroupedList.ALTERNATE_CHILD_STYLE_NAME_INSET_ITEM_RENDERER;
			list.customFirstItemRendererStyleName = GroupedList.ALTERNATE_CHILD_STYLE_NAME_INSET_FIRST_ITEM_RENDERER;
			list.customLastItemRendererStyleName = GroupedList.ALTERNATE_CHILD_STYLE_NAME_INSET_LAST_ITEM_RENDERER;
			list.customSingleItemRendererStyleName = GroupedList.ALTERNATE_CHILD_STYLE_NAME_INSET_SINGLE_ITEM_RENDERER;
			list.customHeaderRendererStyleName = GroupedList.ALTERNATE_CHILD_STYLE_NAME_INSET_HEADER_RENDERER;
			list.customFooterRendererStyleName = GroupedList.ALTERNATE_CHILD_STYLE_NAME_INSET_FOOTER_RENDERER;
			
			var layout:VerticalLayout = new VerticalLayout();
			layout.useVirtualLayout = true;
			layout.padding = smallGutterSize;
			layout.gap = 0;
			layout.horizontalAlign = HorizontalAlign.JUSTIFY;
			layout.verticalAlign = VerticalAlign.TOP;
			list.layout = layout;
		}
		
		protected function setInsetGroupedListItemRendererStyles(renderer:DefaultGroupedListItemRenderer, defaultSkinTexture:Texture, selectedAndDownSkinTexture:Texture, scale9Grid:Rectangle):void
		{
			var skin:ImageSkin = new ImageSkin(defaultSkinTexture);
			skin.selectedTexture = selectedAndDownSkinTexture;
			skin.setTextureForState(ButtonState.DOWN, selectedAndDownSkinTexture);
			skin.scale9Grid = scale9Grid;
			skin.width = gridSize;
			skin.height = gridSize;
			
			renderer.defaultSkin = skin;
			
			renderer.horizontalAlign = HorizontalAlign.LEFT;
			renderer.paddingTop = smallGutterSize;
			renderer.paddingBottom = smallGutterSize;
			renderer.paddingLeft = gutterSize + smallGutterSize;
			renderer.paddingRight = gutterSize;
			renderer.gap = gutterSize;
			renderer.minGap = gutterSize;
			renderer.iconPosition = RelativePosition.LEFT;
			renderer.accessoryGap = Number.POSITIVE_INFINITY;
			renderer.minAccessoryGap = gutterSize;
			renderer.accessoryPosition = RelativePosition.RIGHT;
			renderer.minWidth = renderer.minHeight = gridSize;
			renderer.minTouchWidth = renderer.minTouchHeight = gridSize;
		}
		
		protected function setInsetGroupedListMiddleItemRendererStyles(renderer:DefaultGroupedListItemRenderer):void
		{
			setInsetGroupedListItemRendererStyles(renderer, insetItemRendererUpSkinTexture, insetItemRendererSelectedSkinTexture, INSET_ITEM_RENDERER_MIDDLE_SCALE9_GRID);
		}
		
		protected function setInsetGroupedListFirstItemRendererStyles(renderer:DefaultGroupedListItemRenderer):void
		{
			setInsetGroupedListItemRendererStyles(renderer, insetItemRendererFirstUpSkinTexture, insetItemRendererFirstSelectedSkinTexture, INSET_ITEM_RENDERER_FIRST_SCALE9_GRID);
		}
		
		protected function setInsetGroupedListLastItemRendererStyles(renderer:DefaultGroupedListItemRenderer):void
		{
			setInsetGroupedListItemRendererStyles(renderer, insetItemRendererLastUpSkinTexture, insetItemRendererLastSelectedSkinTexture, INSET_ITEM_RENDERER_LAST_SCALE9_GRID);
		}
		
		protected function setInsetGroupedListSingleItemRendererStyles(renderer:DefaultGroupedListItemRenderer):void
		{
			setInsetGroupedListItemRendererStyles(renderer, insetItemRendererSingleUpSkinTexture, insetItemRendererSingleSelectedSkinTexture, INSET_ITEM_RENDERER_SINGLE_SCALE9_GRID);
		}
		
		protected function setInsetGroupedListHeaderRendererStyles(renderer:DefaultGroupedListHeaderOrFooterRenderer):void
		{
			var defaultSkin:Quad = new Quad(1, 1, 0xff00ff);
			defaultSkin.alpha = 0;
			
			renderer.backgroundSkin = defaultSkin;
			
			renderer.horizontalAlign = HorizontalAlign.LEFT;
			renderer.paddingTop = smallGutterSize;
			renderer.paddingBottom = smallGutterSize;
			renderer.paddingLeft = gutterSize + smallGutterSize;
			renderer.paddingRight = gutterSize;
			renderer.minWidth = controlSize;
			renderer.minHeight = controlSize;
		}
		
		protected function setInsetGroupedListFooterRendererStyles(renderer:DefaultGroupedListHeaderOrFooterRenderer):void
		{
			var defaultSkin:Quad = new Quad(1, 1, 0xff00ff);
			defaultSkin.alpha = 0;
			
			renderer.backgroundSkin = defaultSkin;
			
			renderer.customContentLabelStyleName = THEME_STYLE_NAME_GROUPED_LIST_FOOTER_CONTENT_LABEL;
			
			renderer.horizontalAlign = HorizontalAlign.CENTER;
			renderer.paddingTop = smallGutterSize;
			renderer.paddingBottom = smallGutterSize;
			renderer.paddingLeft = gutterSize + smallGutterSize;
			renderer.paddingRight = gutterSize;
			renderer.minWidth = controlSize;
			renderer.minHeight = controlSize;
		}
		
		//-------------------------
		// Header
		//-------------------------
		
		protected function setHeaderStyles(header:Header):void
		{
			header.minWidth = gridSize;
			header.minHeight = gridSize;
			header.padding = smallGutterSize;
			header.gap = smallGutterSize;
			header.titleGap = smallGutterSize;
			
			var backgroundSkin:ImageSkin = new ImageSkin(headerBackgroundSkinTexture);
			backgroundSkin.scale9Grid = HEADER_BACKGROUND_SCALE9_GRID;
			backgroundSkin.width = gridSize;
			backgroundSkin.height = gridSize;
			
			header.backgroundSkin = backgroundSkin;
		}
		
		protected function setHeaderTitleStyles(textRenderer:TextBlockTextRenderer):void
		{
			textRenderer.elementFormat = headerElementFormat;
			textRenderer.disabledElementFormat = headerDisabledElementFormat;
		}
		
		//-------------------------
		// Label
		//-------------------------
		
		protected function setHeadingLabelStyles(label:Label):void
		{
			label.customTextRendererStyleName = THEME_STYLE_NAME_HEADING_LABEL_TEXT_RENDERER;
		}
		
		protected function setDetailLabelStyles(label:Label):void
		{
			label.customTextRendererStyleName = THEME_STYLE_NAME_DETAIL_LABEL_TEXT_RENDERER;
		}
				
		protected function setLabelTextRendererStyles(textRenderer:TextBlockTextRenderer):void
		{
			textRenderer.elementFormat = labelElementFormat;
			textRenderer.disabledElementFormat = labelDisabledElementFormat;
		}	
		
		protected function setHeadingLabelTextRendererStyles(textRenderer:TextBlockTextRenderer):void
		{
			textRenderer.elementFormat = headingLabelElementFormat;
			textRenderer.disabledElementFormat = headingLabelDisabledElementFormat;
		}	
		
		protected function setDetailLabelTextRendererStyles(textRenderer:TextBlockTextRenderer):void
		{
			textRenderer.elementFormat = detailLabelElementFormat;
			textRenderer.disabledElementFormat = detailLabelDisabledElementFormat;
		}		
		
		//-------------------------
		// LayoutGroup
		//-------------------------
		
		protected function setToolbarLayoutGroupStyles(group:LayoutGroup):void
		{
			if(!group.layout)
			{
				var layout:HorizontalLayout = new HorizontalLayout();
				layout.padding = smallGutterSize;
				layout.gap = smallGutterSize;
				layout.verticalAlign = VerticalAlign.MIDDLE;
				group.layout = layout;
			}
			
			group.minWidth = gridSize;
			group.minHeight = gridSize;
			
			var backgroundSkin:Image = new Image(headerBackgroundSkinTexture);
			backgroundSkin.tileGrid = new Rectangle();
			backgroundSkin.width = gridSize;
			backgroundSkin.height = gridSize;
			group.backgroundSkin = backgroundSkin;
		}
		
		//-------------------------
		// List
		//-------------------------
		
		protected function setListStyles(list:List):void
		{
			setScrollerStyles(list);
			
			var backgroundSkin:Quad = new Quad(gridSize, gridSize, LIST_BACKGROUND_COLOR);
			list.backgroundSkin = backgroundSkin;
		}
		
		protected function setItemRendererStyles(renderer:BaseDefaultItemRenderer):void
		{
			var skin:ImageSkin = new ImageSkin(itemRendererUpSkinTexture);
			skin.selectedTexture = itemRendererSelectedSkinTexture;
			skin.setTextureForState(ButtonState.DOWN, itemRendererDownSkinTexture);
			skin.scale9Grid = ITEM_RENDERER_SCALE9_GRID;
			skin.width = gridSize;
			skin.height = gridSize;
			renderer.defaultSkin = skin;
			
			renderer.horizontalAlign = HorizontalAlign.LEFT;
			renderer.paddingTop = smallGutterSize;
			renderer.paddingBottom = smallGutterSize;
			renderer.paddingLeft = gutterSize;
			renderer.paddingRight = gutterSize;
			renderer.gap = gutterSize;
			renderer.minGap = gutterSize;
			renderer.iconPosition = RelativePosition.LEFT;
			renderer.accessoryGap = Number.POSITIVE_INFINITY;
			renderer.minAccessoryGap = gutterSize;
			renderer.accessoryPosition = RelativePosition.RIGHT;
			renderer.minWidth = gridSize;
			renderer.minHeight = gridSize;
			renderer.minTouchWidth = gridSize;
			renderer.minTouchHeight = gridSize;
		}
		
		protected function setDrillDownItemRendererStyles(itemRenderer:DefaultListItemRenderer):void
		{
			setItemRendererStyles(itemRenderer);
			
			itemRenderer.itemHasAccessory = false;
			
			var accessorySkin:ImageSkin = new ImageSkin(listDrillDownAccessoryTexture);
			accessorySkin.selectedTexture = listDrillDownAccessorySelectedTexture;
			accessorySkin.setTextureForState(ButtonState.DOWN, listDrillDownAccessorySelectedTexture);
			itemRenderer.defaultAccessory = accessorySkin;
		}
		
		protected function setCheckItemRendererStyles(renderer:BaseDefaultItemRenderer):void
		{
			var skin:ImageSkin = new ImageSkin(itemRendererUpSkinTexture);
			skin.setTextureForState(ButtonState.DOWN, itemRendererSelectedSkinTexture);
			skin.scale9Grid = ITEM_RENDERER_SCALE9_GRID;
			skin.width = gridSize;
			skin.height = gridSize;
			renderer.defaultSkin = skin;
			
			var defaultSelectedIcon:ImageLoader = new ImageLoader();
			defaultSelectedIcon.source = pickerListItemSelectedIconTexture;
			renderer.defaultSelectedIcon = defaultSelectedIcon;
			defaultSelectedIcon.validate();
			
			var defaultIcon:Quad = new Quad(defaultSelectedIcon.width, defaultSelectedIcon.height, 0xff00ff);
			defaultIcon.alpha = 0;
			renderer.defaultIcon = defaultIcon;
			
			renderer.customLabelStyleName = THEME_STYLE_NAME_CHECK_ITEM_RENDERER_LABEL;
			renderer.customIconLabelStyleName = THEME_STYLE_NAME_CHECK_ITEM_RENDERER_ICON_LABEL;
			renderer.customAccessoryLabelStyleName = THEME_STYLE_NAME_CHECK_ITEM_RENDERER_ACCESSORY_LABEL;
			
			renderer.itemHasIcon = false;
			renderer.horizontalAlign = HorizontalAlign.LEFT;
			renderer.paddingTop = smallGutterSize;
			renderer.paddingBottom = smallGutterSize;
			renderer.paddingLeft = gutterSize;
			renderer.paddingRight = gutterSize;
			renderer.gap = Number.POSITIVE_INFINITY;
			renderer.minGap = gutterSize;
			renderer.iconPosition = RelativePosition.RIGHT;
			renderer.accessoryGap = smallGutterSize;
			renderer.minAccessoryGap = smallGutterSize;
			renderer.accessoryPosition = RelativePosition.BOTTOM;
			renderer.layoutOrder = ItemRendererLayoutOrder.LABEL_ACCESSORY_ICON;
			renderer.minWidth = gridSize;
			renderer.minHeight = gridSize;
			renderer.minTouchWidth = gridSize;
			renderer.minTouchHeight = gridSize;
		}
		
		protected function setItemRendererLabelStyles(textRenderer:TextBlockTextRenderer):void
		{
			textRenderer.elementFormat = itemRendererLabelElementFormat;
			textRenderer.disabledElementFormat = itemRendererLabelDisabledElementFormat;
			textRenderer.selectedElementFormat = itemRendererLabelSelectedElementFormat;
			textRenderer.setElementFormatForState(ToggleButton.STATE_DOWN, itemRendererLabelDownElementFormat);
		}
		
		protected function setItemRendererAccessoryLabelStyles(textRenderer:TextBlockTextRenderer):void
		{
			textRenderer.elementFormat = itemRendererAccessoryLabelElementFormat;
			textRenderer.disabledElementFormat = itemRendererAccessoryLabelDisabledElementFormat;
			textRenderer.selectedElementFormat = itemRendererAccessoryLabelSelectedElementFormat;
			textRenderer.setElementFormatForState(ToggleButton.STATE_DOWN, itemRendererAccessoryLabelDownElementFormat);
		}
		
		protected function setItemRendererIconLabelStyles(textRenderer:TextBlockTextRenderer):void
		{
			textRenderer.elementFormat = itemRendererIconLabelElementFormat;
			textRenderer.disabledElementFormat = itemRendererIconLabelDisabledElementFormat;
			textRenderer.selectedElementFormat = itemRendererIconLabelSelectedElementFormat;
			textRenderer.setElementFormatForState(ToggleButton.STATE_DOWN, itemRendererIconLabelDownElementFormat);
		}
		
		protected function setCheckItemRendererLabelStyles(textRenderer:TextBlockTextRenderer):void
		{
			textRenderer.elementFormat = checkItemRendererLabelElementFormat;
			textRenderer.disabledElementFormat = checkItemRendererLabelDisabledElementFormat;
			textRenderer.selectedElementFormat = checkItemRendererLabelSelectedElementFormat;
			textRenderer.setElementFormatForState(ToggleButton.STATE_DOWN, checkItemRendererLabelDownElementFormat);
		}
		
		protected function setCheckItemRendererAccessoryLabelStyles(textRenderer:TextBlockTextRenderer):void
		{
			textRenderer.elementFormat = checkItemRendererAccessoryLabelElementFormat;
			textRenderer.disabledElementFormat = checkIemRendererAccessoryLabelDisabledElementFormat;
			textRenderer.selectedElementFormat = checkItemRendererAccessoryLabelSelectedElementFormat;
			textRenderer.setElementFormatForState(ToggleButton.STATE_DOWN, checkItemRendererAccessoryLabelDownElementFormat);
		}
		
		protected function setCheckItemRendererIconLabelStyles(textRenderer:TextBlockTextRenderer):void
		{
			textRenderer.elementFormat = checkItemRendererIconLabelElementFormat;
			textRenderer.disabledElementFormat = checkItemRendererIconLabelDisabledElementFormat;
			textRenderer.selectedElementFormat = checkItemRendererIconLabelSelectedElementFormat;
			textRenderer.setElementFormatForState(ToggleButton.STATE_DOWN, checkItemRendererIconLabelDownElementFormat);
		}
		
		//-------------------------
		// NumericStepper
		//-------------------------
		
		protected function setNumericStepperStyles(stepper:NumericStepper):void
		{
			stepper.buttonLayoutMode = StepperButtonLayoutMode.SPLIT_HORIZONTAL;
			stepper.incrementButtonLabel = "+";
			stepper.decrementButtonLabel = "-";
		}
		
		protected function setNumericStepperTextInputStyles(input:TextInput):void
		{
			var backgroundSkin:Image = new Image(textInputBackgroundEnableSkinTexture);
			backgroundSkin.scale9Grid = TEXT_INPUT_SCALE9_GRID;
			backgroundSkin.width = controlSize;
			backgroundSkin.height = controlSize;
			input.backgroundSkin = backgroundSkin;
			
			var backgroundDisabledSkin:Image = new Image(textInputBackgroundDisabledSkinTexture);
			backgroundDisabledSkin.scale9Grid = TEXT_INPUT_SCALE9_GRID;
			backgroundDisabledSkin.width = controlSize;
			backgroundDisabledSkin.height = controlSize;
			input.backgroundDisabledSkin = backgroundDisabledSkin;
			
			var backgroundFocusedSkin:Image = new Image(textInputBackgroundFocusedSkinTexture);
			backgroundFocusedSkin.scale9Grid = TEXT_INPUT_SCALE9_GRID;
			backgroundFocusedSkin.width = controlSize;
			backgroundFocusedSkin.height = controlSize;
			input.backgroundFocusedSkin = backgroundFocusedSkin;
			
			input.textEditorFactory = stepperTextEditorFactory;
			input.customTextEditorStyleName = THEME_STYLE_NAME_NUMERIC_STEPPER_TEXT_INPUT_EDITOR;
			
			input.minWidth = controlSize;
			input.minHeight = controlSize;
			input.minTouchWidth = gridSize;
			input.minTouchHeight = gridSize;
			input.gap = smallControlGutterSize;
			input.paddingTop = smallControlGutterSize;
			input.paddingRight = smallGutterSize;
			input.paddingBottom = smallControlGutterSize;
			input.paddingLeft = smallGutterSize;
			input.isEditable = false;
			input.isSelectable = false;
		}
		
		protected function setNumericStepperTextInputEditorStyles(textEditor:TextBlockTextEditor):void
		{
			textEditor.elementFormat = numericStepperElementFormat;
			textEditor.disabledElementFormat = numericStepperDisabledElementFormat;
			textEditor.textAlign = TextBlockTextEditor.TEXT_ALIGN_CENTER;
		}
		
		protected function setNumericStepperButtonStyles(button:Button):void
		{
			setButtonStyles(button);
			button.keepDownStateOnRollOut = true;
		}
		
		//-------------------------
		// PageIndicator
		//-------------------------
		
		protected function setPageIndicatorStyles(pageIndicator:PageIndicator):void
		{
			pageIndicator.normalSymbolFactory = pageIndicatorNormalSymbolFactory;
			pageIndicator.selectedSymbolFactory = pageIndicatorSelectedSymbolFactory;
			pageIndicator.gap = smallGutterSize;
			pageIndicator.padding = smallGutterSize;
			pageIndicator.minTouchWidth = smallControlSize * 2;
			pageIndicator.minTouchHeight = smallControlSize * 2;
		}
		
		//-------------------------
		// Panel
		//-------------------------
		
		protected function setPanelStyles(panel:Panel):void
		{
			setScrollerStyles(panel);
			
			var backgroundSkin:Image = new Image(panelBackgroundSkinTexture);
			backgroundSkin.scale9Grid = PANEL_BACKGROUND_SCALE9_GRID;
			panel.backgroundSkin = backgroundSkin;
			panel.padding = smallGutterSize;
			panel.outerPadding = borderSize;
		}
		
		protected function setHeaderWithoutBackgroundStyles(header:Header):void
		{
			header.minWidth = gridSize;
			header.minHeight = gridSize;
			header.padding = smallGutterSize;
			header.gap = smallGutterSize;
			header.titleGap = smallGutterSize;
		}
		
		//-------------------------
		// PanelScreen
		//-------------------------
		
		protected function setPanelScreenStyles(screen:PanelScreen):void
		{
			screen.paddingTop = -5;
			
			setScrollerStyles(screen);
		}
		
		protected function setPanelScreenHeaderStyles(header:Header):void
		{
			setHeaderStyles(header);
			
			header.useExtraPaddingForOSStatusBar = true;			
		}
		
		//-------------------------
		// PickerList
		//-------------------------
		
		protected function setPickerListStyles(list:PickerList):void
		{
			if(DeviceCapabilities.isTablet(Starling.current.nativeStage))
			{
				list.popUpContentManager = new CalloutPopUpContentManager();
			}
			else
			{
				list.listFactory = pickerListSpinnerListFactory;
				list.popUpContentManager = new BottomDrawerPopUpContentManager();
			}
		}
		
		protected function setPickerListPopUpListStyles(list:List):void
		{
			if(DeviceCapabilities.isTablet(Starling.current.nativeStage))
			{
				list.minWidth = popUpFillSize;
				list.maxHeight = popUpFillSize;
			}
			else //phone
			{
				//the pop-up list should be a SpinnerList in this case, but we
				//should provide a reasonable fallback skin if the listFactory
				//on the PickerList returns a List instead. we don't want the
				//List to be too big for the BottomDrawerPopUpContentManager
				
				var backgroundSkin:Image = new Image(pickerListBackgroundSkinTexture);
				backgroundSkin.scale9Grid = PICKER_LIST_BACKGROUND_SCALE9_GRID;
				backgroundSkin.width = gridSize;
				backgroundSkin.height = gridSize;
				list.backgroundSkin = backgroundSkin;
				list.padding = smallGutterSize;
				
				var layout:VerticalLayout = new VerticalLayout();
				layout.horizontalAlign = HorizontalAlign.JUSTIFY;
				layout.requestedRowCount = 4;
				list.layout = layout;
			}
			
			list.customItemRendererStyleName = DefaultListItemRenderer.ALTERNATE_STYLE_NAME_CHECK;
		}
		
		protected function setPickerListButtonStyles(button:Button):void
		{
			setButtonStyles(button);
			
			var icon:ImageSkin = new ImageSkin(pickerListButtonIconTexture);
			icon.selectedTexture = pickerListButtonSelectedIconTexture;
			icon.setTextureForState(ButtonState.DISABLED, pickerListButtonIconDisabledTexture);
			button.defaultIcon = icon;
			
			button.gap = Number.POSITIVE_INFINITY;
			button.minGap = gutterSize;
			button.iconPosition = RelativePosition.RIGHT;
		}
		
		//-------------------------
		// ProgressBar
		//-------------------------
		
		protected function setProgressBarStyles(progress:ProgressBar):void
		{
			var backgroundSkin:Image;
			var backgroundDisabledSkin:Image;
			
			if(progress.direction === Direction.HORIZONTAL)
			{
				backgroundSkin = new Image(horizontalProgressBarBackgroundSkinTexture);
				backgroundSkin.scale9Grid = HORIZONTAL_PROGRESS_BAR_SCALE9_GRID;
				backgroundSkin.width = wideControlSize;
				backgroundSkin.height = smallControlSize;
				backgroundDisabledSkin = new Image(horizontalProgressBarBackgroundDisabledSkinTexture);
				backgroundDisabledSkin.scale9Grid = HORIZONTAL_PROGRESS_BAR_SCALE9_GRID;
				backgroundDisabledSkin.width = wideControlSize;
				backgroundDisabledSkin.height = smallControlSize;
			}
			else //vertical
			{
				backgroundSkin = new Image(verticalProgressBarBackgroundSkinTexture);
				backgroundSkin.scale9Grid = VERTICAL_PROGRESS_BAR_SCALE9_GRID;
				backgroundSkin.width = smallControlSize;
				backgroundSkin.height = wideControlSize;
				backgroundDisabledSkin = new Image(verticalProgressBarBackgroundDisabledSkinTexture);
				backgroundDisabledSkin.scale9Grid = VERTICAL_PROGRESS_BAR_SCALE9_GRID;
				backgroundDisabledSkin.width = smallControlSize;
				backgroundDisabledSkin.height = wideControlSize;
			}
			progress.backgroundSkin = backgroundSkin;
			progress.backgroundDisabledSkin = backgroundDisabledSkin;
			
			var fillSkin:Image;
			var fillDisabledSkin:Image;
			
			if(progress.direction === Direction.HORIZONTAL)
			{
				fillSkin = new Image(horizontalProgressBarFillSkinTexture);
				fillSkin.scale9Grid = HORIZONTAL_PROGRESS_BAR_SCALE9_GRID;
				fillSkin.width = smallControlSize;
				fillSkin.height = smallControlSize;
				fillDisabledSkin = new Image(horizontalProgressBarFillDisabledSkinTexture);
				fillDisabledSkin.scale9Grid = HORIZONTAL_PROGRESS_BAR_SCALE9_GRID;
				fillDisabledSkin.width = smallControlSize;
				fillDisabledSkin.height = smallControlSize;
			}
			else
			{
				fillSkin = new Image(verticalProgressBarFillSkinTexture);
				fillSkin.scale9Grid = VERTICAL_PROGRESS_BAR_SCALE9_GRID;
				fillSkin.width = smallControlSize;
				fillSkin.height = smallControlSize;
				fillDisabledSkin = new Image(verticalProgressBarFillDisabledSkinTexture);
				fillDisabledSkin.scale9Grid = VERTICAL_PROGRESS_BAR_SCALE9_GRID;
				fillDisabledSkin.width = smallControlSize;
				fillDisabledSkin.height = smallControlSize;
			}
			
			progress.fillSkin = fillSkin;
			progress.fillDisabledSkin = fillDisabledSkin;
		}
		
		//-------------------------
		// Radio
		//-------------------------
		
		protected function setRadioStyles(radio:Radio):void
		{
			var icon:ImageSkin = new ImageSkin(radioUpIconTexture);
			icon.selectedTexture = radioSelectedUpIconTexture;
			icon.setTextureForState(ButtonState.DOWN, radioDownIconTexture);
			icon.setTextureForState(ButtonState.DISABLED, radioDisabledIconTexture);
			icon.setTextureForState(ButtonState.DOWN_AND_SELECTED, radioSelectedDownIconTexture);
			icon.setTextureForState(ButtonState.DISABLED_AND_SELECTED, radioSelectedDisabledIconTexture);
			radio.defaultIcon = icon;
			
			radio.horizontalAlign = HorizontalAlign.LEFT;
			radio.gap = smallControlGutterSize;
			radio.minGap = smallControlGutterSize;
			radio.minWidth = controlSize;
			radio.minHeight = controlSize;
			radio.minTouchWidth = gridSize;
			radio.minTouchHeight = gridSize;
		}
		
		protected function setRadioLabelStyles(textRenderer:TextBlockTextRenderer):void
		{
			textRenderer.elementFormat = radioElementFormat;
			textRenderer.disabledElementFormat = radioDisabledElementFormat;
		}
		
		//-------------------------
		// ScrollContainer
		//-------------------------
		
		protected function setScrollContainerStyles(container:ScrollContainer):void
		{
			setScrollerStyles(container);
		}
		
		protected function setToolbarScrollContainerStyles(container:ScrollContainer):void
		{
			setScrollerStyles(container);
			
			if(!container.layout)
			{
				var layout:HorizontalLayout = new HorizontalLayout();
				layout.padding = smallGutterSize;
				layout.gap = smallGutterSize;
				layout.verticalAlign = VerticalAlign.MIDDLE;
				container.layout = layout;
			}
			
			container.minWidth = gridSize;
			container.minHeight = gridSize;
			
			var backgroundSkin:Image = new Image(headerBackgroundSkinTexture);
			backgroundSkin.tileGrid = new Rectangle();
			backgroundSkin.width = gridSize;
			backgroundSkin.height = gridSize;
			container.backgroundSkin = backgroundSkin;
		}
		
		//-------------------------
		// ScrollScreen
		//-------------------------
		
		protected function setScrollScreenStyles(screen:ScrollScreen):void
		{
			setScrollerStyles(screen);
		}
		
		//-------------------------
		// ScrollText
		//-------------------------
		
		protected function setScrollTextStyles(text:ScrollText):void
		{
			setScrollerStyles(text);
			
			text.textFormat = scrollTextTextFormat;
			text.disabledTextFormat = scrollTextDisabledTextFormat;
			text.embedFonts = true;
			text.padding = gutterSize;
			text.paddingRight = gutterSize + smallGutterSize;
		}
		
		//-------------------------
		// SimpleScrollBar
		//-------------------------
		
		protected function setSimpleScrollBarStyles(scrollBar:SimpleScrollBar):void
		{
			if(scrollBar.direction == Direction.HORIZONTAL)
			{
				scrollBar.paddingRight = scrollBarGutterSize;
				scrollBar.paddingBottom = scrollBarGutterSize;
				scrollBar.paddingLeft = scrollBarGutterSize;
				scrollBar.customThumbStyleName = THEME_STYLE_NAME_HORIZONTAL_SIMPLE_SCROLL_BAR_THUMB;
			}
			else
			{
				scrollBar.paddingTop = scrollBarGutterSize;
				scrollBar.paddingRight = scrollBarGutterSize;
				scrollBar.paddingBottom = scrollBarGutterSize;
				scrollBar.customThumbStyleName = THEME_STYLE_NAME_VERTICAL_SIMPLE_SCROLL_BAR_THUMB;
			}
		}
		
		protected function setHorizontalSimpleScrollBarThumbStyles(thumb:Button):void
		{
			var defaultSkin:Image = new Image(horizontalScrollBarThumbSkinTexture);
			defaultSkin.scale9Grid = HORIZONTAL_SCROLL_BAR_THUMB_SCALE9_GRID;
			defaultSkin.width = smallGutterSize;
			thumb.defaultSkin = defaultSkin;
			thumb.hasLabelTextRenderer = false;
		}
		
		protected function setVerticalSimpleScrollBarThumbStyles(thumb:Button):void
		{
			var defaultSkin:Image = new Image(verticalScrollBarThumbSkinTexture);
			defaultSkin.scale9Grid = VERTICAL_SCROLL_BAR_THUMB_SCALE9_GRID;
			defaultSkin.height = smallGutterSize;
			thumb.defaultSkin = defaultSkin;
			thumb.hasLabelTextRenderer = false;
		}
		
		//-------------------------
		// Slider
		//-------------------------
		
		protected function setSliderStyles(slider:Slider):void
		{
			slider.trackLayoutMode = TrackLayoutMode.SPLIT;
			slider.minimumPadding = slider.maximumPadding = -smallControlGutterSize;
			
			if(slider.direction == Direction.VERTICAL)
			{
				slider.customMinimumTrackStyleName = THEME_STYLE_NAME_VERTICAL_SLIDER_MINIMUM_TRACK;
				slider.customMaximumTrackStyleName = THEME_STYLE_NAME_VERTICAL_SLIDER_MAXIMUM_TRACK;
				slider.minWidth = controlSize;
			}
			else //horizontal
			{
				slider.customMinimumTrackStyleName = THEME_STYLE_NAME_HORIZONTAL_SLIDER_MINIMUM_TRACK;
				slider.customMaximumTrackStyleName = THEME_STYLE_NAME_HORIZONTAL_SLIDER_MAXIMUM_TRACK;
				slider.minHeight = controlSize;
			}
		}
		
		protected function setSliderButtonStyles(button:Button):void
		{
			var skin:ImageSkin = new ImageSkin(sliderButtonUpSkinTexture);
			skin.setTextureForState(ButtonState.DOWN, sliderButtonDownSkinTexture);
			skin.setTextureForState(ButtonState.DISABLED, sliderButtonDisabledSkinTexture);
			
			skin.scale9Grid = SLIDER_BUTTON_SCALE9_GRID;
			skin.width = 40;
			skin.height = 40;
			
			button.defaultSkin = skin;
		}
		
		protected function setHorizontalSliderMinimumTrackStyles(track:Button):void
		{
			var skin:ImageSkin = new ImageSkin(horizontalSliderMinimumTrackSkinTexture);
			skin.disabledTexture = horizontalSliderMinimumTrackDisabledSkinTexture;
			skin.scale9Grid = HORIZONTAL_MINIMUM_TRACK_SCALE9_GRID;
			skin.width = wideControlSize;
			skin.height = controlSize;
			track.defaultSkin = skin;
			
			track.hasLabelTextRenderer = false;
		}
		
		protected function setHorizontalSliderMaximumTrackStyles(track:Button):void
		{
			var skin:ImageSkin = new ImageSkin(horizontalSliderMaximumTrackSkinTexture);
			skin.disabledTexture = horizontalSliderMaximumTrackDisabledSkinTexture;
			skin.scale9Grid = HORIZONTAL_MAXIMUM_TRACK_SCALE9_GRID;
			skin.width = wideControlSize;
			skin.height = controlSize;
			track.defaultSkin = skin;
			
			track.hasLabelTextRenderer = false;
		}
		
		protected function setVerticalSliderMinimumTrackStyles(track:Button):void
		{
			var skin:ImageSkin = new ImageSkin(verticalSliderMinimumTrackSkinTexture);
			skin.disabledTexture = verticalSliderMinimumTrackDisabledSkinTexture;
			skin.scale9Grid = VERTICAL_MINIMUM_TRACK_SCALE9_GRID;
			skin.width = controlSize;
			skin.height = wideControlSize;
			track.defaultSkin = skin;
			
			track.hasLabelTextRenderer = false;
		}
		
		protected function setVerticalSliderMaximumTrackStyles(track:Button):void
		{
			var skin:ImageSkin = new ImageSkin(verticalSliderMaximumTrackSkinTexture);
			skin.disabledTexture = verticalSliderMaximumTrackDisabledSkinTexture;
			skin.scale9Grid = VERTICAL_MAXIMUM_TRACK_SCALE9_GRID;
			skin.width = controlSize;
			skin.height = wideControlSize;
			track.defaultSkin = skin;
			
			track.hasLabelTextRenderer = false;
		}
		
		//-------------------------
		// SpinnerList
		//-------------------------
		
		protected function setSpinnerListStyles(list:SpinnerList):void
		{
			setScrollerStyles(list);
			
			var backgroundSkin:Image = new Image(spinnerListBackgroundSkinTexture);
			backgroundSkin.scale9Grid = SPINNER_LIST_BACKGROUND_SCALE9_GRID;
			list.backgroundSkin = backgroundSkin;
			
			var selectionOverlaySkin:Image = new Image(spinnerListSelectionOverlaySkinTexture);
			selectionOverlaySkin.scale9Grid = SPINNER_LIST_SELECTION_OVERLAY_SCALE9_GRID;
			list.selectionOverlaySkin = selectionOverlaySkin;
			
			list.customItemRendererStyleName = THEME_STYLE_NAME_SPINNER_LIST_ITEM_RENDERER;
			
			list.paddingTop = borderSize;
			list.paddingBottom = borderSize;
		}
		
		protected function setSpinnerListItemRendererStyles(renderer:DefaultListItemRenderer):void
		{
			var defaultSkin:Quad = new Quad(1, 1, 0xff00ff);
			defaultSkin.alpha = 0;
			renderer.defaultSkin = defaultSkin;
			
			renderer.customLabelStyleName = THEME_STYLE_NAME_SPINNER_LIST_ITEM_RENDERER_LABEL;
			renderer.customIconLabelStyleName = THEME_STYLE_NAME_SPINNER_LIST_ITEM_RENDERER_ICON_LABEL;
			renderer.customAccessoryLabelStyleName = THEME_STYLE_NAME_SPINNER_LIST_ITEM_RENDERER_ACCESSORY_LABEL;
			
			renderer.horizontalAlign = HorizontalAlign.LEFT;
			renderer.paddingTop = smallGutterSize;
			renderer.paddingBottom = smallGutterSize;
			renderer.paddingLeft = gutterSize;
			renderer.paddingRight = gutterSize;
			renderer.gap = gutterSize;
			renderer.minGap = gutterSize;
			renderer.iconPosition = RelativePosition.LEFT;
			renderer.accessoryGap = Number.POSITIVE_INFINITY;
			renderer.minAccessoryGap = gutterSize;
			renderer.accessoryPosition = RelativePosition.RIGHT;
			renderer.minWidth = gridSize;
			renderer.minHeight = gridSize;
			renderer.minTouchWidth = gridSize;
			renderer.minTouchHeight = gridSize;
		}
		
		protected function setSpinnerListItemRendererLabelStyles(textRenderer:TextBlockTextRenderer):void
		{			
			textRenderer.elementFormat = spinnerListItemRendererLabelElementFormat;
			textRenderer.disabledElementFormat = spinnerListItemRendererLabelDisabledElementFormat;
		}
		
		protected function setSpinnerListItemRendererIconLabelStyles(textRenderer:TextBlockTextRenderer):void
		{
			textRenderer.elementFormat = spinnerListItemRendererIconLabelElementFormat;
			textRenderer.disabledElementFormat = spinnerListItemRendererIconLabelDisabledElementFormat;
		}
		
		protected function setSpinnerListItemRendererAccessoryLabelStyles(textRenderer:TextBlockTextRenderer):void
		{
			textRenderer.elementFormat = spinnerListItemRendererAccessoryLabelElementFormat;
			textRenderer.disabledElementFormat = spinnerListItemRendererAccessoryLabelDisabledElementFormat;
		}
		
		//-------------------------
		// TabBar
		//-------------------------
		
		protected function setTabBarStyles(tabBar:TabBar):void
		{
			tabBar.distributeTabSizes = true;
		}
		
		protected function setTabStyles(tab:ToggleButton):void
		{
			var skin:ImageSkin = new ImageSkin(tabUpSkinTexture);
			skin.selectedTexture = tabSelectedUpSkinTexture;
			skin.setTextureForState(ButtonState.DOWN, tabDownSkinTexture);
			skin.setTextureForState(ButtonState.DISABLED, tabDisabledSkinTexture);
			skin.setTextureForState(ButtonState.DISABLED_AND_SELECTED, tabSelectedDisabledSkinTexture);
			skin.scale9Grid = TAB_SCALE9_GRID;
			skin.width = gridSize;
			skin.height = gridSize;
			tab.defaultSkin = skin;
			
			tab.customLabelStyleName = THEME_STYLE_NAME_TAB_LABEL;
			
			tab.paddingTop = smallGutterSize;
			tab.paddingBottom = smallGutterSize;
			tab.paddingLeft = gutterSize;
			tab.paddingRight = gutterSize;
			tab.gap = smallGutterSize;
			tab.minGap = smallGutterSize;
			tab.minWidth = tab.minHeight = gridSize;
			tab.minTouchWidth = tab.minTouchHeight = gridSize;
		}
		
		protected function setTabLabelStyles(textRenderer:TextBlockTextRenderer):void
		{
			textRenderer.elementFormat = tabLabelElementFormat;
			textRenderer.disabledElementFormat = tabLabelDisabledElementFormat;
			textRenderer.selectedElementFormat = tabLabelSelectedElementFormat;
			textRenderer.setElementFormatForState(ToggleButton.STATE_DOWN, tabLabelDownElementFormat);
		}
		
		//-------------------------
		// TextArea
		//-------------------------
		
		protected function setTextAreaStyles(textArea:TextArea):void
		{
			setScrollerStyles(textArea);
			
			var skin:ImageSkin = new ImageSkin(textAreaBackgroundEnableSkinTexture);
			skin.setTextureForState(TextInputState.DISABLED, textAreaBackgroundDisabledSkinTexture);
			skin.setTextureForState(TextInputState.FOCUSED, textAreaBackgroundFocusedSkinTexture);
			skin.setTextureForState(TextInputState.ERROR, textAreaBackgroundErrorSkinTexture);
			skin.scale9Grid = TEXT_AREA_SCALE9_GRID;
			skin.width = wideControlSize;
			skin.height = wideControlSize;
			textArea.backgroundSkin = skin;
			
			textArea.textEditorFactory = textAreaTextEditorFactory;
		}
		
		protected function setTextAreaTextEditorStyles(textEditor:TextFieldTextEditorViewPort):void
		{
			textEditor.textFormat = textAreaTextFormat;
			textEditor.disabledTextFormat = textAreaDisabledTextFormat;
			
			textEditor.padding = smallGutterSize;
		}
		
		protected function setTextAreaErrorCalloutStyles(callout:TextCallout):void
		{
			setDangerCalloutStyles(callout);
			callout.horizontalAlign = HorizontalAlign.LEFT;
			callout.verticalAlign = VerticalAlign.TOP;
		}
		
		//-------------------------
		// TextCallout
		//-------------------------
		
		protected function setTextCalloutStyles(callout:TextCallout):void
		{
			setCalloutStyles(callout);
		}
		
		protected function setTextCalloutTextRendererStyles(textRenderer:TextBlockTextRenderer):void
		{
			textRenderer.elementFormat = textCalloutTextElementFormat;
		}
		
		//-------------------------
		// TextInput
		//-------------------------
		
		protected function setBaseTextInputStyles(input:TextInput):void
		{
			var skin:ImageSkin = new ImageSkin(textInputBackgroundEnableSkinTexture);
			skin.setTextureForState(TextInputState.DISABLED, textInputBackgroundDisabledSkinTexture);
			skin.setTextureForState(TextInputState.FOCUSED, textInputBackgroundFocusedSkinTexture);
			skin.setTextureForState(TextInputState.ERROR, textInputBackgroundErrorSkinTexture);
			skin.scale9Grid = TEXT_INPUT_SCALE9_GRID;
			skin.width = wideControlSize;
			skin.height = controlSize;
			input.backgroundSkin = skin;
			
			input.minWidth = controlSize;
			input.minHeight = controlSize;
			input.minTouchWidth = gridSize;
			input.minTouchHeight = gridSize;
			input.gap = smallControlGutterSize;
			input.paddingTop = smallControlGutterSize;
			input.paddingRight = smallGutterSize;
			input.paddingBottom = smallControlGutterSize;
			input.paddingLeft = smallGutterSize;
			input.verticalAlign = VerticalAlign.MIDDLE;
		}
		
		protected function setTextInputStyles(input:TextInput):void
		{
			setBaseTextInputStyles(input);
		}
		
		protected function setTextInputTextEditorStyles(textEditor:StageTextTextEditor):void
		{
			textEditor.fontFamily = "Helvetica";
			textEditor.fontSize = regularFontSize;
			textEditor.color = DARK_TEXT_COLOR;
			textEditor.disabledColor = DARK_TEXT_COLOR;
		}
		
		protected function setTextInputPromptStyles(textRenderer:TextBlockTextRenderer):void
		{
			textRenderer.elementFormat = textInputPromptElementFormat;
			textRenderer.disabledElementFormat = textInputPromptDisabledElementFormat;
		}
		
		protected function setTextInputErrorCalloutStyles(callout:TextCallout):void
		{
			setDangerCalloutStyles(callout);
			callout.horizontalAlign = HorizontalAlign.LEFT;
			callout.verticalAlign = VerticalAlign.TOP;
		}
		
		protected function setSearchTextInputStyles(input:TextInput):void
		{
			var skin:ImageSkin = new ImageSkin(searchTextInputBackgroundEnableSkinTexture);
			skin.setTextureForState(TextInputState.DISABLED, searchTextInputBackgroundDisabledSkinTexture);
			skin.setTextureForState(TextInputState.FOCUSED, searchTextInputBackgroundFocusedSkinTexture);
			skin.scale9Grid = SEARCH_TEXT_INPUT_SCALE9_GRID;
			skin.width = wideControlSize;
			skin.height = controlSize;
			input.backgroundSkin = skin;
			
			input.minWidth = controlSize;
			input.minHeight = controlSize;
			input.minTouchWidth = gridSize;
			input.minTouchHeight = gridSize;
			input.gap = smallControlGutterSize;
			input.paddingTop = smallControlGutterSize;
			input.paddingRight = smallGutterSize;
			input.paddingBottom = smallControlGutterSize;
			input.paddingLeft = smallGutterSize;
			input.verticalAlign = VerticalAlign.MIDDLE;
			
			var icon:ImageSkin = new ImageSkin(searchIconTexture);
			icon.setTextureForState(TextInputState.DISABLED, searchIconDisabledTexture);
			input.defaultIcon = icon;
		}
		
		//-------------------------
		// ToggleSwitch
		//-------------------------
		
		protected function setToggleSwitchStyles(toggle:ToggleSwitch):void
		{
			toggle.paddingLeft = toggle.paddingRight = -3;
			toggle.showLabels = false;
			toggle.trackLayoutMode = ToggleSwitch.TRACK_LAYOUT_MODE_ON_OFF;
			toggle.toggleThumbSelection = true;
			toggle.minTouchWidth = toggle.minTouchHeight = controlSize;
			toggle.isQuickHitAreaEnabled = true;
			toggle.toggleDuration = 0.3;
			
			toggle.thumbFactory = function ():Button 
			{
				return new ToggleButton();
			};
		}
		
		protected function setToggleSwitchOnTrackStyles(track:Button):void
		{
			var skin:ImageSkin = new ImageSkin( toggleSwitchOnTrackSkinTexture );
			skin.disabledTexture = toggleSwitchOnTrackDisabledSkinTexture;
			skin.width = 44;
			skin.height = 30;
			skin.scale9Grid = TOGGLE_SWITCH_TRACK_SCALE9_GRID;
			
			track.defaultSkin = skin;
			track.maxWidth = 44;
			track.minHeight = 30;
			track.hasLabelTextRenderer = false;
		}
		
		protected function setToggleSwitchOffTrackStyles(track:Button):void
		{			
			var skin:ImageSkin = new ImageSkin( toggleSwitchOffTrackSkinTexture );
			skin.disabledTexture = toggleSwitchOffTrackDisabledSkinTexture;
			skin.width = 44;
			skin.height = 30;
			skin.scale9Grid = TOGGLE_SWITCH_TRACK_SCALE9_GRID;
			
			track.defaultSkin = skin;
			track.maxWidth = 44;
			track.minHeight = 30;
			track.hasLabelTextRenderer = false;
		}
		
		protected function setToggleSwitchThumbStyles(thumb:Button):void
		{			
			var skin:ImageSkin = new ImageSkin(toggleSwitchOffThumbTexture);
			skin.defaultTexture = toggleSwitchOffThumbTexture;
			skin.selectedTexture = toggleSwitchOnThumbTexture;
			skin.disabledTexture = toggleSwitchDisabledThumbTexture;
			skin.width = 30;
			skin.height = 30;
			skin.scale9Grid = TOGGLE_SWITCH_THUMB_SCALE9_GRID;
			
			thumb.defaultSkin = skin;
			thumb.hasLabelTextRenderer = false;
			thumb.isQuickHitAreaEnabled = true;
			thumb.minTouchWidth = thumb.minTouchHeight = controlSize;
		}
	}
}



