I;21;Foundation/CPBundle.ji;17;CPCompatibility.ji;9;CPEvent.ji;8;CPMenu.ji;13;CPResponder.ji;22;CPDocumentController.ji;14;CPThemeBlend.ji;14;CPCibLoading.ji;12;CPPlatform.jc;18296;
var _1="CPMainCibFile",_2="Main cib file base name";
CPApp=nil;
CPApplicationWillFinishLaunchingNotification="CPApplicationWillFinishLaunchingNotification";
CPApplicationDidFinishLaunchingNotification="CPApplicationDidFinishLaunchingNotification";
CPRunStoppedResponse=-1000;
CPRunAbortedResponse=-1001;
CPRunContinuesResponse=-1002;
var _3=objj_allocateClassPair(CPResponder,"CPApplication"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_eventListeners"),new objj_ivar("_currentEvent"),new objj_ivar("_windows"),new objj_ivar("_keyWindow"),new objj_ivar("_mainWindow"),new objj_ivar("_mainMenu"),new objj_ivar("_documentController"),new objj_ivar("_currentSession"),new objj_ivar("_delegate"),new objj_ivar("_finishedLaunching"),new objj_ivar("_namedArgs"),new objj_ivar("_args"),new objj_ivar("_fullArgsString")]);
objj_registerClassPair(_3);
objj_addClassForBundle(_3,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_3,[new objj_method(sel_getUid("init"),function(_5,_6){
with(_5){
_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CPResponder")},"init");
if(_5){
_eventListeners=[];
_windows=[];
objj_msgSend(_windows,"addObject:",nil);
_mainMenu=objj_msgSend(objj_msgSend(CPMenu,"alloc"),"initWithTitle:","MainMenu");
objj_msgSend(_mainMenu,"setAutoenablesItems:",NO);
var _7=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPApplication,"class")),_8=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","New",sel_getUid("newDocument:"),"N");
objj_msgSend(_8,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","CPApplication/New.png"),CGSizeMake(16,16)));
objj_msgSend(_8,"setAlternateImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","CPApplication/NewHighlighted.png"),CGSizeMake(16,16)));
objj_msgSend(_mainMenu,"addItem:",_8);
var _9=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Open",sel_getUid("openDocument:"),"O");
objj_msgSend(_9,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","CPApplication/Open.png"),CGSizeMake(16,16)));
objj_msgSend(_9,"setAlternateImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","CPApplication/OpenHighlighted.png"),CGSizeMake(16,16)));
objj_msgSend(_mainMenu,"addItem:",_9);
var _a=objj_msgSend(objj_msgSend(CPMenu,"alloc"),"initWithTitle:","Save"),_b=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Save",sel_getUid("saveDocument:"),nil);
objj_msgSend(_b,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","CPApplication/Save.png"),CGSizeMake(16,16)));
objj_msgSend(_b,"setAlternateImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","CPApplication/SaveHighlighted.png"),CGSizeMake(16,16)));
objj_msgSend(_a,"addItem:",objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Save",sel_getUid("saveDocument:"),"S"));
objj_msgSend(_a,"addItem:",objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Save As",sel_getUid("saveDocumentAs:"),nil));
objj_msgSend(_b,"setSubmenu:",_a);
objj_msgSend(_mainMenu,"addItem:",_b);
var _c=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Edit",nil,nil),_d=objj_msgSend(objj_msgSend(CPMenu,"alloc"),"initWithTitle:","Edit"),_e=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Undo",sel_getUid("undo:"),CPUndoKeyEquivalent),_f=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Redo",sel_getUid("redo:"),CPRedoKeyEquivalent);
objj_msgSend(_e,"setKeyEquivalentModifierMask:",CPUndoKeyEquivalentModifierMask);
objj_msgSend(_f,"setKeyEquivalentModifierMask:",CPRedoKeyEquivalentModifierMask);
objj_msgSend(_d,"addItem:",_e);
objj_msgSend(_d,"addItem:",_f);
objj_msgSend(_d,"addItem:",objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Cut",sel_getUid("cut:"),"X")),objj_msgSend(_d,"addItem:",objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Copy",sel_getUid("copy:"),"C")),objj_msgSend(_d,"addItem:",objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Paste",sel_getUid("paste:"),"V"));
objj_msgSend(_c,"setSubmenu:",_d);
objj_msgSend(_c,"setHidden:",YES);
objj_msgSend(_mainMenu,"addItem:",_c);
objj_msgSend(_mainMenu,"addItem:",objj_msgSend(CPMenuItem,"separatorItem"));
}
return _5;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_10,_11,_12){
with(_10){
if(_delegate==_12){
return;
}
var _13=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_delegate){
objj_msgSend(_13,"removeObserver:name:object:",_delegate,CPApplicationWillFinishLaunchingNotification,_10);
objj_msgSend(_13,"removeObserver:name:object:",_delegate,CPApplicationDidFinishLaunchingNotification,_10);
}
_delegate=_12;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("applicationWillFinishLaunching:"))){
objj_msgSend(_13,"addObserver:selector:name:object:",_delegate,sel_getUid("applicationWillFinishLaunching:"),CPApplicationWillFinishLaunchingNotification,_10);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("applicationDidFinishLaunching:"))){
objj_msgSend(_13,"addObserver:selector:name:object:",_delegate,sel_getUid("applicationDidFinishLaunching:"),CPApplicationDidFinishLaunchingNotification,_10);
}
}
}),new objj_method(sel_getUid("delegate"),function(_14,_15){
with(_14){
return _delegate;
}
}),new objj_method(sel_getUid("finishLaunching"),function(_16,_17){
with(_16){
var _18=objj_msgSend(CPBundle,"mainBundle"),_19=objj_msgSend(_18,"objectForInfoDictionaryKey:","CPBundleDocumentTypes");
if(objj_msgSend(_19,"count")>0){
_documentController=objj_msgSend(CPDocumentController,"sharedDocumentController");
}
var _1a=objj_msgSend(_18,"objectForInfoDictionaryKey:","CPApplicationDelegateClass");
if(_1a){
var _1b=objj_getClass(_1a);
if(_1b){
if(objj_msgSend(_documentController,"class")==_1b){
objj_msgSend(_16,"setDelegate:",_documentController);
}else{
objj_msgSend(_16,"setDelegate:",objj_msgSend(objj_msgSend(_1b,"alloc"),"init"));
}
}
}
var _1c=objj_msgSend(CPNotificationCenter,"defaultCenter");
objj_msgSend(_1c,"postNotificationName:object:",CPApplicationWillFinishLaunchingNotification,_16);
var _1d=window.cpOpeningFilename&&window.cpOpeningFilename(),_1e=!!_documentController;
if(objj_msgSend(_1d,"length")){
objj_msgSend(_16,"_openFile:",_1d);
_1e=NO;
}
if(_1e&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("applicationShouldOpenUntitledFile:"))){
_1e=objj_msgSend(_delegate,"applicationShouldOpenUntitledFile:",_16);
}
if(_1e){
objj_msgSend(_documentController,"newDocument:",_16);
}
objj_msgSend(_1c,"postNotificationName:object:",CPApplicationDidFinishLaunchingNotification,_16);
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
_finishedLaunching=YES;
}
}),new objj_method(sel_getUid("run"),function(_1f,_20){
with(_1f){
objj_msgSend(_1f,"finishLaunching");
}
}),new objj_method(sel_getUid("runModalForWindow:"),function(_21,_22,_23){
with(_21){
objj_msgSend(_21,"runModalSession:",objj_msgSend(_21,"beginModalSessionForWindow:",_23));
}
}),new objj_method(sel_getUid("stopModalWithCode:"),function(_24,_25,_26){
with(_24){
if(!_currentSession){
return;
}
_currentSession._state=_26;
_currentSession=_currentSession._previous;
objj_msgSend(_24,"_removeRunModalLoop");
}
}),new objj_method(sel_getUid("_removeRunModalLoop"),function(_27,_28){
with(_27){
var _29=_eventListeners.length;
while(_29--){
if(_eventListeners[_29]._callback===_2a){
_eventListeners.splice(_29,1);
return;
}
}
}
}),new objj_method(sel_getUid("stopModal"),function(_2b,_2c){
with(_2b){
objj_msgSend(_2b,"stopModalWithCode:",CPRunStoppedResponse);
}
}),new objj_method(sel_getUid("abortModal"),function(_2d,_2e){
with(_2d){
objj_msgSend(_2d,"stopModalWithCode:",CPRunAbortedResponse);
}
}),new objj_method(sel_getUid("beginModalSessionForWindow:"),function(_2f,_30,_31){
with(_2f){
return _32(_31,0);
}
}),new objj_method(sel_getUid("runModalSession:"),function(_33,_34,_35){
with(_33){
_35._previous=_currentSession;
_currentSession=_35;
var _36=_35._window;
objj_msgSend(_36,"center");
objj_msgSend(_36,"makeKeyAndOrderFront:",_33);
objj_msgSend(CPApp,"setCallback:forNextEventMatchingMask:untilDate:inMode:dequeue:",_2a,CPAnyEventMask,nil,0,NO);
}
}),new objj_method(sel_getUid("modalWindow"),function(_37,_38){
with(_37){
if(!_currentSession){
return nil;
}
return _currentSession._window;
}
}),new objj_method(sel_getUid("_handleKeyEquivalent:"),function(_39,_3a,_3b){
with(_39){
if(objj_msgSend(_mainMenu,"performKeyEquivalent:",_3b)){
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("sendEvent:"),function(_3c,_3d,_3e){
with(_3c){
_currentEvent=_3e;
if(objj_msgSend(_3e,"type")==CPKeyDown&&objj_msgSend(_3e,"modifierFlags")&(CPCommandKeyMask|CPControlKeyMask)&&objj_msgSend(objj_msgSend(_3e,"characters"),"length")>0&&objj_msgSend(_3c,"_handleKeyEquivalent:",_3e)){
return;
}
if(_eventListeners.length){
if(_eventListeners[_eventListeners.length-1]._mask&(1<<objj_msgSend(_3e,"type"))){
_eventListeners.pop()._callback(_3e);
}
return;
}
objj_msgSend(objj_msgSend(_3e,"window"),"sendEvent:",_3e);
}
}),new objj_method(sel_getUid("doCommandBySelector:"),function(_3f,_40,_41){
with(_3f){
if(objj_msgSend(_delegate,"respondsToSelector:",_41)){
objj_msgSend(_delegate,"performSelector:",_41);
}else{
objj_msgSendSuper({receiver:_3f,super_class:objj_getClass("CPResponder")},"doCommandBySelector:",_41);
}
}
}),new objj_method(sel_getUid("keyWindow"),function(_42,_43){
with(_42){
return _keyWindow;
}
}),new objj_method(sel_getUid("mainWindow"),function(_44,_45){
with(_44){
return _mainWindow;
}
}),new objj_method(sel_getUid("windowWithWindowNumber:"),function(_46,_47,_48){
with(_46){
return _windows[_48];
}
}),new objj_method(sel_getUid("windows"),function(_49,_4a){
with(_49){
return _windows;
}
}),new objj_method(sel_getUid("mainMenu"),function(_4b,_4c){
with(_4b){
return _mainMenu;
}
}),new objj_method(sel_getUid("setMainMenu:"),function(_4d,_4e,_4f){
with(_4d){
_mainMenu=_4f;
}
}),new objj_method(sel_getUid("orderFrontColorPanel:"),function(_50,_51,_52){
with(_50){
objj_msgSend(objj_msgSend(CPColorPanel,"sharedColorPanel"),"orderFront:",_50);
}
}),new objj_method(sel_getUid("orderFrontStandardAboutPanel:"),function(_53,_54,_55){
with(_53){
objj_msgSend(_53,"orderFrontStandardAboutPanelWithOptions:",nil);
}
}),new objj_method(sel_getUid("orderFrontStandardAboutPanelWithOptions:"),function(_56,_57,_58){
with(_56){
}
}),new objj_method(sel_getUid("tryToPerform:with:"),function(_59,_5a,_5b,_5c){
with(_59){
if(!_5b){
return NO;
}
if(objj_msgSendSuper({receiver:_59,super_class:objj_getClass("CPResponder")},"tryToPerform:with:",_5b,_5c)){
return YES;
}
if(objj_msgSend(_delegate,"respondsToSelector:",_5b)){
objj_msgSend(_delegate,"performSelector:withObject:",_5b,_5c);
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("sendAction:to:from:"),function(_5d,_5e,_5f,_60,_61){
with(_5d){
var _62=objj_msgSend(_5d,"targetForAction:to:from:",_5f,_60,_61);
if(!_62){
return NO;
}
objj_msgSend(_62,"performSelector:withObject:",_5f,_61);
return YES;
}
}),new objj_method(sel_getUid("targetForAction:to:from:"),function(_63,_64,_65,_66,_67){
with(_63){
if(!_65){
return nil;
}
if(_66){
return _66;
}
return objj_msgSend(_63,"targetForAction:",_65);
}
}),new objj_method(sel_getUid("_targetForWindow:action:"),function(_68,_69,_6a,_6b){
with(_68){
var _6c=objj_msgSend(_6a,"firstResponder"),_6d=YES;
while(_6c){
if(objj_msgSend(_6c,"respondsToSelector:",_6b)){
return _6c;
}
if(_6c==_6a){
_6d=NO;
}
_6c=objj_msgSend(_6c,"nextResponder");
}
if(_6d&&objj_msgSend(_6a,"respondsToSelector:",_6b)){
return _6a;
}
var _6e=objj_msgSend(_6a,"delegate");
if(objj_msgSend(_6e,"respondsToSelector:",_6b)){
return _6e;
}
var _6f=objj_msgSend(_6a,"windowController");
if(objj_msgSend(_6f,"respondsToSelector:",_6b)){
return _6f;
}
var _70=objj_msgSend(_6f,"document");
if(_70!=_6e&&objj_msgSend(_70,"respondsToSelector:",_6b)){
return _70;
}
return nil;
}
}),new objj_method(sel_getUid("targetForAction:"),function(_71,_72,_73){
with(_71){
if(!_73){
return nil;
}
var _74=objj_msgSend(_71,"_targetForWindow:action:",objj_msgSend(_71,"keyWindow"),_73);
if(_74){
return _74;
}
_74=objj_msgSend(_71,"_targetForWindow:action:",objj_msgSend(_71,"mainWindow"),_73);
if(_74){
return _74;
}
if(objj_msgSend(_71,"respondsToSelector:",_73)){
return _71;
}
if(objj_msgSend(_delegate,"respondsToSelector:",_73)){
return _delegate;
}
if(objj_msgSend(_documentController,"respondsToSelector:",_73)){
return _documentController;
}
return nil;
}
}),new objj_method(sel_getUid("setCallback:forNextEventMatchingMask:untilDate:inMode:dequeue:"),function(_75,_76,_77,_78,_79,_7a,_7b){
with(_75){
_eventListeners.push(_7c(_78,_77));
if(_eventListeners.length==3){
objj_debug_print_backtrace();
}
}
}),new objj_method(sel_getUid("setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:"),function(_7d,_7e,_7f,_80,_81,_82,_83,_84){
with(_7d){
_eventListeners.push(_7c(_81,function(_85){
objj_msgSend(_7f,_80,_85);
}));
}
}),new objj_method(sel_getUid("currentEvent"),function(_86,_87){
with(_86){
return _currentEvent;
}
}),new objj_method(sel_getUid("beginSheet:modalForWindow:modalDelegate:didEndSelector:contextInfo:"),function(_88,_89,_8a,_8b,_8c,_8d,_8e){
with(_88){
objj_msgSend(_8b,"_attachSheet:modalDelegate:didEndSelector:contextInfo:",_8a,_8c,_8d,_8e);
}
}),new objj_method(sel_getUid("arguments"),function(_8f,_90){
with(_8f){
if(_fullArgsString!=window.location.hash){
objj_msgSend(_8f,"_reloadArguments");
}
return _args;
}
}),new objj_method(sel_getUid("setArguments:"),function(_91,_92,_93){
with(_91){
if(!_93||_93.length==0){
_args=[];
window.location.hash="#";
return;
}
if(objj_msgSend(_93,"class")!=CPArray){
_93=objj_msgSend(CPArray,"arrayWithObject:",_93);
}
_args=_93;
var _94=objj_msgSend(_args,"copy");
for(var i=0,_96=_94.length;i<_96;i++){
_94[i]=encodeURIComponent(_94[i]);
}
var _97=objj_msgSend(_94,"componentsJoinedByString:","/");
window.location.hash="#"+_97;
}
}),new objj_method(sel_getUid("_reloadArguments"),function(_98,_99){
with(_98){
_fullArgsString=window.location.hash;
var _9a=_fullArgsString.replace("#","").split("/").slice(0);
for(var i=0,_9c=_9a.length;i<_9c;i++){
_9a[i]=decodeURIComponent(_9a[i]);
}
_args=_9a;
}
}),new objj_method(sel_getUid("namedArguments"),function(_9d,_9e){
with(_9d){
return _namedArgs;
}
}),new objj_method(sel_getUid("_openFile:"),function(_9f,_a0,_a1){
with(_9f){
objj_msgSend(_documentController,"openDocumentWithContentsOfURL:display:error:",_a1,YES,NULL);
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("sharedApplication"),function(_a2,_a3){
with(_a2){
if(!CPApp){
CPApp=objj_msgSend(objj_msgSend(CPApplication,"alloc"),"init");
}
return CPApp;
}
})]);
var _32=function(_a4,_a5){
return {_window:_a4,_state:CPRunContinuesResponse,_previous:nil};
};
var _7c=function(_a6,_a7){
return {_mask:_a6,_callback:_a7};
};
var _2a=function(_a8){
objj_msgSend(CPApp,"setCallback:forNextEventMatchingMask:untilDate:inMode:dequeue:",_2a,CPAnyEventMask,nil,0,NO);
var _a9=objj_msgSend(_a8,"window"),_aa=CPApp._currentSession;
if(_a9==_aa._window||objj_msgSend(_a9,"worksWhenModal")){
objj_msgSend(_a9,"sendEvent:",_a8);
}
};
CPApplicationMain=function(_ab,_ac){
var _ad=objj_msgSend(CPBundle,"mainBundle"),_ae=objj_msgSend(_ad,"principalClass");
if(!_ae){
_ae=objj_msgSend(CPApplication,"class");
}
objj_msgSend(_ae,"sharedApplication");
if(!_ab){
var _ab=objj_msgSend(CPApp,"arguments");
if(objj_msgSend(_ab,"containsObject:","debug")){
CPLogRegister(CPLogPopup);
}
}
if(!_ac){
var _af=window.location.search.substring(1).split("&");
_ac=objj_msgSend(CPDictionary,"dictionary");
for(var i=0;i<_af.length;i++){
var _b1=_af[i].indexOf("=");
if(_b1==-1){
objj_msgSend(_ac,"setObject:forKey:","",_af[i]);
}else{
objj_msgSend(_ac,"setObject:forKey:",_af[i].substring(_b1+1),_af[i].substring(0,_b1));
}
}
}
CPApp._args=_ab;
CPApp._namedArgs=_ac;
objj_msgSend(_CPAppBootstrapper,"performActions");
};
var _b2=nil;
var _3=objj_allocateClassPair(CPObject,"_CPAppBootstrapper"),_4=_3.isa;
objj_registerClassPair(_3);
objj_addClassForBundle(_3,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("actions"),function(_b3,_b4){
with(_b3){
return [sel_getUid("bootstrapPlatform"),sel_getUid("loadDefaultTheme"),sel_getUid("loadMainCibFile")];
}
}),new objj_method(sel_getUid("performActions"),function(_b5,_b6){
with(_b5){
if(!_b2){
_b2=objj_msgSend(_b5,"actions");
}
while(_b2.length){
var _b7=_b2.shift();
if(objj_msgSend(_b5,_b7)){
return;
}
}
objj_msgSend(CPApp,"run");
}
}),new objj_method(sel_getUid("bootstrapPlatform"),function(_b8,_b9){
with(_b8){
return objj_msgSend(CPPlatform,"bootstrap");
}
}),new objj_method(sel_getUid("loadDefaultTheme"),function(_ba,_bb){
with(_ba){
var _bc=objj_msgSend(objj_msgSend(CPThemeBlend,"alloc"),"initWithContentsOfURL:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPApplication,"class")),"pathForResource:","Aristo.blend"));
objj_msgSend(_bc,"loadWithDelegate:",_ba);
return YES;
}
}),new objj_method(sel_getUid("blendDidFinishLoading:"),function(_bd,_be,_bf){
with(_bd){
objj_msgSend(CPTheme,"setDefaultTheme:",objj_msgSend(CPTheme,"themeNamed:","Aristo"));
objj_msgSend(_bd,"performActions");
}
}),new objj_method(sel_getUid("loadMainCibFile"),function(_c0,_c1){
with(_c0){
var _c2=objj_msgSend(CPBundle,"mainBundle"),_c3=objj_msgSend(_c2,"objectForInfoDictionaryKey:",_1)||objj_msgSend(_c2,"objectForInfoDictionaryKey:",_2);
if(_c3){
objj_msgSend(_c2,"loadCibFile:externalNameTable:loadDelegate:",_c3,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",CPApp,CPCibOwner),_c0);
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("cibDidFinishLoading:"),function(_c4,_c5,_c6){
with(_c4){
objj_msgSend(_c4,"performActions");
}
})]);
